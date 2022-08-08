import xml.etree.ElementTree as ElementTree
import sys


def sync_excluded_files(excluded_files_config: str, file_name: str):
    tree = ElementTree.parse(file_name)
    excluded_files = get_already_excluded_files(tree)
    files_to_exclude = get_files_to_exclude(excluded_files_config, excluded_files)
    if len(files_to_exclude) == 0:
        print('No files to exclude')
        return

    exclude_files(tree, files_to_exclude)
    print_tree(file_name, tree)
    print(f'Synced {file_name} with excluded files')


def get_already_excluded_files(tree: ElementTree):
    component = tree.find('component')
    content = component.find('content')
    if component is None or content is None:
        print('No component or content node found, exiting...')
        return []

    exclude_patterns = content.findall('excludePattern')
    return [excludePattern.get('pattern') for excludePattern in exclude_patterns]


def get_files_to_exclude(excluded_files_config: str, already_excluded_files: list[str]):
    with open(excluded_files_config) as file:
        files_to_exclude = file.read().splitlines()
        return list(
            set(files_to_exclude).symmetric_difference(set(already_excluded_files))
        )


def exclude_files(tree: ElementTree, files_to_exclude):
    def exclude_file(file_name: str):
        component = tree.find('component')
        content = component.find('content')
        exclude_pattern = ElementTree.SubElement(content, "excludePattern")
        exclude_pattern.set('pattern', file_name)

    for file in files_to_exclude:
        exclude_file(file)


def print_tree(file_name: str, tree: ElementTree):
    ElementTree.indent(tree, space="\t", level=0)
    tree.write(file_or_filename=file_name, encoding='UTF-8')


if __name__ == '__main__':
    [_, config, file_to_sync] = sys.argv
    sync_excluded_files(config, file_to_sync)

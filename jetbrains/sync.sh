ALVA_BASE_DIR=~/alva

function get_project_files() {
  find $ALVA_BASE_DIR -maxdepth 3 -name "*.iml"
}

get_project_files | while read PROJECT; do
  python utils/sync-excluded-files.py .excluded-files $PROJECT
done

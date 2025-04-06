generate-basic-auth-file() {
  set -eo pipefail

  # Function to display usage
  _gba_usage() {
    echo "Usage: generate-basic-auth-file [-u username] [-p password] [-f filepath]"
    return 1
  }

  # Parse command-line arguments
  while getopts ":u:p:f:" opt; do
    case $opt in
      u) USERNAME=$OPTARG ;;
      p) PASSWORD=$OPTARG ;;
      f) FILEPATH=$OPTARG ;;
      *) _gba_usage; return 1 ;;
    esac
  done

  # Prompt for username if not provided
  if [ -z "$USERNAME" ]; then
    read -p "Enter username: " USERNAME
  fi

  # Prompt for password if not provided
  if [ -z "$PASSWORD" ]; then
    read -sp "Enter password: " PASSWORD
    echo
  fi

  # Prompt for file path if not provided
  if [ -z "$FILEPATH" ]; then
    read -p "Enter file path: " FILEPATH
  fi

  # Check if htpasswd is installed
  if ! command -v htpasswd &> /dev/null; then
    echo "Error: htpasswd could not be found. Please install it first."
    return 1
  fi

  # Generate the htpasswd file
  htpasswd -cb "$FILEPATH" "$USERNAME" "$PASSWORD"

  echo "htpasswd file created at $FILEPATH"
}


# Hành động 2: Tạo symbolic link hoặc junction
# Lấy đường dẫn gốc của folder chứa script
SCRIPT_DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)

echo "$SCRIPT_DIR is main link"

# Kiểm tra hệ điều hành
if [[ "$(uname)" == "Darwin" ]]; then
  # Mac OS
  ln -s "$SCRIPT_DIR/storage/app/public" "$SCRIPT_DIR/public/storage"
else
  # Windows
  cmd /c mklink /D "$SCRIPT_DIR\storage\app\public" "$SCRIPT_DIR\public\storage"
fi

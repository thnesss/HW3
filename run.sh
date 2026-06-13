data="$(pwd)/data"
ldata="$(pwd)/local_data"
mkdir -p "$data"
mkdir -p "$ldata"
case "$1" in
  build_generator)
    docker build -t data-generator ./gen
    ;;
  run_generator)
    docker run --rm -v "$data":/data data-generator
    ;;
  create_local_data)
    python3 gen/generate.py "$ldata"
    ;;
esac
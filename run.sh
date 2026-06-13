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
  build_reporter)
    docker build -t data-reporter ./rep
    ;;
  run_reporter)
    docker run --rm -v "$data":/data data-reporter
    ;;
  structure)
    find .
    ;;
  clear_data)
    rm -f "$data"/*.csv "$data"/*.html
    ;;
  inside_generator)
    docker run --rm -v "$data":/data --entrypoint sh data-generator -c "ls -la /data"
    ;;
  inside_reporter)
    docker run --rm -v "$data":/data --entrypoint sh data-reporter -c "ls -la /data"
    ;;
esac
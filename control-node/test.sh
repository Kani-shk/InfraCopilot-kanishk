for port in 8080 5678 9000 9090 3000; do
  echo "Testing port $port..."
  curl -sI http://localhost:$port | head -n 1
done


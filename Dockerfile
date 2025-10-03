FROM yandex/clickhouse-server:21

# Wrapper to forward Render $PORT to ClickHouse HTTP 8123
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Use wrapper as container command
CMD ["/start.sh"]

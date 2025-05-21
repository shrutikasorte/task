FROM python:3.12-alpine3.20
RUN addgroup --system appgroup && adduser --system --ingroup appgroup appuser
WORKDIR /app
COPY simple_time_service.py .
RUN pip install flask
RUN chown -R appuser:appgroup /app
USER appuser
EXPOSE 5000
CMD ["python", "simple_time_service.py"]


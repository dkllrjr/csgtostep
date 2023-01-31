FROM amrit3701/freecad-cli:0.20-arm64

COPY convert.py /python/convert.py

WORKDIR /data
ENTRYPOINT ["python3", "/python/convert.py"]

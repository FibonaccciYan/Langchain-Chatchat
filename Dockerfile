FROM python:3.11-slim as base

WORKDIR /Langchain-Chatchat

COPY requirements.txt requirements_api.txt requirements_webui.txt ./

RUN --mount=type=cache,target=/root/.cache/pip \
    pip install --no-cache-dir -r requirements.txt -i https://pypi.doubanio.com/simple/ && \
    pip install --no-cache-dir -r requirements_api.txt -i https://pypi.doubanio.com/simple/ && \
    pip install --no-cache-dir -r requirements_webui.txt -i https://pypi.doubanio.com/simple/

# COPY ./bge-large-zh-v1.5/ ./bge-large-zh-v1.5/
# COPY ./chatglm3-6b/ ./chatglm3-6b/

COPY . .

ENV HF_HOME=/Langchain-Chatchat/huggingface_cache

EXPOSE 8501
EXPOSE 7861
EXPOSE 20000

# 定义入口点
# ENTRYPOINT ["bash", "start_service.sh"]
ENTRYPOINT ["bash"]
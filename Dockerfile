FROM mageai/mageai:0.9.65

ARG USER_CODE_PATH=/home/src/globsuicide

COPY requirements.txt ${USER_CODE_PATH}requirements.txt 

RUN pip3 install -r ${USER_CODE_PATH}requirements.txt
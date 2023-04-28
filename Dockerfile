FROM bitnami/pytorch
RUN pip install jupyter datasets numpy pandas scikit-learn scipy wandb transformers torch torchvision librosa
RUN pip install "ipython<8.13"
ENV TRANSFORMERS_CACHE /app/transformers_cache
ENV WANDB_CONFIG_DIR /app/wandb_config
RUN mkdir -p $TRANSFORMERS_CACHE
ADD sounds_spoof.ipynb .
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]

FROM bioconductor/bioconductor_docker:RELEASE_3_16

LABEL Name=Transcriptomics_SupBioTech_2023 Version=0.0.2

# Install miniconda to /miniconda
RUN curl -LO http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -p /miniconda -b
RUN rm Miniconda3-latest-Linux-x86_64.sh
ENV PATH=/miniconda/bin:${PATH}
RUN conda update -y conda
RUN conda config --add channels bioconda

# Install Micromamba environnemt
COPY env.yaml /tmp/env.yaml
RUN conda env update --file /tmp/env.yaml && \
    conda clean --all --yes 

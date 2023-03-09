# R + Python + Julia kernels
FROM jupyter/datascience-notebook:x86_64-2023-03-06

# Python kernel only
# ROM jupyter/scipy-notebook:x86_64-2023-03-06

# R kernel only
# ROM jupyter/r-notebook:x86_64-2023-03-06

USER root

### system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        lmodern file curl && \
    apt-get clean -y && \
    rm -rf /tmp/rstudio.deb /var/lib/apt/lists/* /tmp/library-scripts

### R studio
# RUN curl --silent -L --fail \
#         https://download2.rstudio.org/server/bionic/amd64/rstudio-server-2022.02.3-492-amd64.deb > /tmp/rstudio.deb && \
#     apt-get update && \
#     apt-get install -y --no-install-recommends \
#         /tmp/rstudio.deb && \
#     apt-get clean -y && \
#     rm -rf /tmp/rstudio.deb /var/lib/apt/lists/* /tmp/library-scripts

### quarto
# versions: https://quarto.org/docs/download/_download.json
# neat setup: https://github.com/jeremiahpslewis/reproducibility-with-quarto
RUN curl --silent -L --fail \
        https://github.com/quarto-dev/quarto-cli/releases/download/v1.2.269/quarto-1.2.269-linux-amd64.deb > /tmp/quarto.deb && \
    apt-get update && \
    apt-get install -y --no-install-recommends /tmp/quarto.deb && \
    rm -rf /tmp/quarto.deb /var/lib/apt/lists/* /tmp/library-scripts

USER ${NB_USER}

### prints Jupyter server token when terminal is opened
RUN echo "echo \"Jupyter server token: \$(jupyter server list 2>&1 | grep -oP '(?<=token=)[[:alnum:]]*')\"" > ${HOME}/.get-jupyter-url.sh && \
    echo "sh \${HOME}/.get-jupyter-url.sh" >> ${HOME}/.bashrc

### R development
RUN pip install radian && \
    R -q -e 'install.packages(c("markdown", "languageserver", "httpgd"), repos="cloud.r-project.org")' &&\
    R -q -e 'remotes::install_github("ManuelHentschel/vscDebugger")'

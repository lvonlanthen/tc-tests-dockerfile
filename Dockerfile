FROM drydock/u16pytall:v5.7.1

# Dependencies for the project.
RUN sudo apt-get update && sudo apt-get -y install \
    unzip \
    python3-pip \
    binutils \
    libproj-dev \
    gdal-bin \
    postgresql-9.6-postgis \
    libxss1 \
    libappindicator1

# Use python3.6 by default
RUN ln -s -f /usr/bin/python3.6 /usr/bin/python

# Chrome browser for functional tests.
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && sudo dpkg -i ./google-chrome*.deb \
    && sudo apt-get install -f

# Chromedriver for functional tests.
RUN wget https://chromedriver.storage.googleapis.com/2.32/chromedriver_linux64.zip \
    && unzip chromedriver* \
    && chmod +x chromedriver && chmod 777 chromedriver \
    && mv chromedriver /usr/bin/chromedriver

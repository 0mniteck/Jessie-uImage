FROM armhf/debian
COPY sources.list /etc/apt/sources.list
COPY WORKBOOK.sh /WORKBOOK.sh
ENV PYENV_ROOT /pyenv
ENV PATH $PYENV_ROOT/bin:$PATH
ENV LANG C.UTF-8
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 112695A0E562B32A 54404762BBB6E853 648ACFD622F3D138 0E98404D386FA1D9 605C66F00D6C9793 AA8E81B4331F7F50
RUN apt-get -o Acquire::Check-Valid-Until=false update
RUN apt-get upgrade -y
RUN apt-get install firmware-linux-nonfree firmware-linux-free linux-headers-4.9.0-0.bpo.12-all linux-headers-4.9.0-0.bpo.12-common-rt sunxi-tools make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl git asciidoc autoconf automake autotools-dev bc bison bsdmainutils cpio debhelper diffstat docbook-xml docbook-xsl docutils-common flex fonts-font-awesome gettext gettext-base groff-base intltool-debian kmod libasprintf0c2 libaudit-dev libbison-dev libcroco3 libdw-dev libdw1 libelf-dev libelfg0 libfl-dev libglib2.0-bin libglib2.0-dev libiberty-dev libjs-jquery libjs-sphinxdoc libjs-underscore libmpdec2 libnewt-dev libnewt0.52 libpci-dev libpci3 libpcre3-dev libpcrecpp0 libperl-dev libperl5.20 libpython-dev libpython2.7 libpython2.7-dev libpython3-stdlib libpython3.4-minimal libpython3.4-stdlib libsigsegv2 libslang2-dev libtool libudev-dev libunistring0 libunwind-dev libunwind8 libunwind8-dev libwrap0 libwrap0-dev libxml2-utils libxslt1.1 m4 man-db patchutils po-debconf python-dev python-docutils python-jinja2 python-markupsafe python-pygments python-roman python-sphinx python-sphinx-rtd-theme python2.7-dev quilt sgml-data sphinx-common xmlto xsltproc u-boot-tools -y
RUN curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
RUN eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)" && pyenv install -v 3.4.2
RUN ln -f -s -v $PYENV_ROOT/versions/3.4.2/bin/* /usr/bin/
RUN apt-get source linux-4.9

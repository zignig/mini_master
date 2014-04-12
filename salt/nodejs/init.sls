# download and install nodejs

# http://nodejs.org/dist/v0.10.26/node-v0.10.26.tar.gz

node_compile:
  module.wait:
    - name: cmd.run
    - cmd: make ; make install
    - cwd: /opt/

node_extract:
  module.wait:
    - name: cmd.run
    - cmd: tar -zxf node-v0.10.26.tar.gz
    - cwd: /opt/
    - watch_in:
      - module: node_compile

/opt/node-v0.10.26.tar.gz:
  file.managed
    - name: http://nodejs.org/dist/v0.10.26/node-v0.10.26.tar.gz
    - source_hash: http://nodejs.org/dist/v0.10.26/SHASUMS.txt
    - watch_in:
      - module: node_extract

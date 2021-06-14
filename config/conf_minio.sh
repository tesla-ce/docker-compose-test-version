#!/bin/bash
mc alias set minio https://storage.tesla-ce minioadmin minioadmin --insecure
mc policy set download minio/tesla-public --insecure

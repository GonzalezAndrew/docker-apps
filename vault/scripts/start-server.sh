#!/bin/sh

vault server -config=/vault/config/vault.hcl >>/vault/logs/vault.logs 2>&1 



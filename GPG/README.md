# GnuPG

## Cheat sheet
```
<file> - file name
<name> - uid of a key
```

### Creating key
```
$ gpg --full-generate-key
```

#### Add identity to a key
```
$ gpg --edit-key <name>

gpg> adduid
gpg> save
```

### Creating key
```
$ gpg --delete-key <name>
```

### Importing key
```
$ gpg --import <file>
```

### Exporting key
```
$ gpg --armor --output <file> --export <name>
```
s	
	a## Signing a key
	oireiofrijfv ### local sign
`###``
iqweV
$ gpg --lsign <name>
```
das### Sign
```
$ gpg --edit-key <name>

gpg> sign
gpg> save
```

#### check
```
$ gpg --check-sig <name>

```

### Encrypting/Decrypting messages
#### Sign a message
```
gpg --local-user <name> --clearsign <file>
```

#### Encrypt a message
```
gpg --armor --recipient <receiver's name> --recipient <your name>
     --encrypt <file>
```

#### Sign and encrypt a message
```
gpg --local-user <your name> --recipient <receiver's name>
     --recipient <your name> --armor --sign --encrypt <file>
```

#### Verify sign
```
gpg --verify <file>
```

#### Decrypt (and verify)
```
gpg --decrypt-files <file>
```


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
### Importing key
```
$ gpg --import <file>
```

### Exporting key
```
$ gpg --armor --output <file> --export <name>
```

### Signing
#### local sign
```
$ gpg --lsign <name>
```
#### Sign
```
$ gpg --edit-key <name>

gpg> sign
gpg> save
```

#### check
```
$ gpg --check-sig <name>
```

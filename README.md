# ts2 - Twissell's Storage System

`ts2` is a collection of command-line tools I use for managing my cold storage system. It handles disk formatting, checksum verification, and PAR2 parity file creation and verification.

## Scripts

The main `ts2` script acts as a dispatcher for the other tools.

### `checksum`

Calculates or verifies `SHA512` checksums for files in a directory and its subdirectories. It automatically excludes metadata files like `checksums.sha512*`, `.par2`, and `metadata.json`.

**Usage**

```
Usage: checksum [ACTION] [DIRECTORY]

Calculates or verifies SHA512 checksums for files in a directory and its subdirectories.

Actions:
  -c, --calculate   Calculate and store checksums.
  -v, --verify      Verify existing checksums.

Arguments:
  DIRECTORY         The target directory.
```

**Examples**

- **Calculate checksums:**

```bash
./ts2 checksum -c <directory>
```

- **Verify checksums:**

```bash
./ts2 checksum -v <directory>
```

### `parity`

Creates, verifies, repairs, or deletes `PAR2` parity files for data recovery.

**Usage**

```
Usage: parity [ACTION] [DIRECTORY]

Calculates, verifies, or repairs PAR2 data for files in a directory and its subdirectories.

Actions:
  -c, --calculate   Calculate and store PAR2 data.
  -v, --verify      Verify existing PAR2 data.
  -r, --repair      Repair files using PAR2 data.
  -d, --delete      Delete all PAR2 data.

Arguments:
  DIRECTORY         The target directory.
```

**Examples**

- **Create parity files:**

```bash
./ts2 parity -c <directory>
```

- **Verify parity files:**

```bash
./ts2 parity -v <directory>
```

- **Repair files:**

```bash
./ts2 parity -r <directory>
```

- **Delete parity files:**

```bash
./ts2 parity -d <directory>
```

### `format-disk`

Formats a specified block device with a new `exFAT` filesystem. This is a destructive operation and will erase all data on the device.

**Usage**

```
Usage: format-disk DEVICE LABEL

DEVICE: The device to format (e.g. /dev/sdb)
LABEL: The label for the new exFAT filesystem (max 15 characters)
```

**Examples**

```bash
./ts2 format-disk /dev/sdb MY_DRIVE
```

### `safe-umount`

Safely unmounts a specified mount point and powers off the underlying device using `udisksctl`.

**Usage**

```
Usage: safe-umount MOUNTPOINT

MOUNTPOINT: The mount point to unmount (e.g. /media/damian/str-00)
```

**Examples**

```bash
./ts2 safe-umount /media/user/mydisk
```

## Dependencies

- `bash`
- `coreutils` (`sha512sum`, `find`, etc.)
- `par2`
- `parted`
- `wipefs`
- `udisks2` (`udisksctl`)
- `exfatprogs` (`mkfs.exfat`)

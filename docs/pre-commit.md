# Pre-Commit Hooks Explained

The following are explanations for each pre-commit hook (v5.0.0):

---

## 1. `fix-byte-order-marker`
- **Purpose**: Removes UTF-8 Byte Order Marker (BOM) from files.
- **Why?** BOMs can cause issues with scripts/parsers, especially on Windows.
- **Effect**: Silently strips `0xEF,0xBB,0xBF` from file headers.

## 2. `check-case-conflict`
- **Purpose**: Detects filenames differing only by case (e.g., `File.txt` vs `file.txt`).
- **Why?** Case-insensitive filesystems (Windows/macOS) can't handle such conflicts.
- **Effect**: Fails if conflicting filenames exist.

## 3. `check-merge-conflict`
- **Purpose**: Scans for unresolved Git merge markers (`<<<<<<<`, `=======`, `>>>>>>>`).
- **Why?** Prevents accidental commit of merge conflicts.
- **Effect**: Fails if conflict markers are found.

## 4. `detect-aws-credentials`
- **Purpose**: Flags AWS credentials (`access_key`, `secret_key`) in files.
- **Why?** Avoids security risks from leaked credentials in version control.
- **Args**: `--allow-missing-credentials` suppresses false positives.
- **Effect**: Fails if AWS keys are detected (unless allowed).

## 5. `detect-private-key`
- **Purpose**: Detects private keys (SSH, SSL, etc.) in files.
- **Why?** Prevents accidental exposure of cryptographic keys.
- **Effect**: Fails if private keys are found.

## 6. `end-of-file-fixer`
- **Purpose**: Ensures files end with exactly one newline (`\n`).
- **Why?** Many tools require trailing newlines for correct parsing.
- **Effect**: Adds/removes newlines to standardize endings.

## 7. `mixed-line-ending`
- **Purpose**: Normalizes line endings (LF vs CRLF).
- **Why?** Mixed line endings cause issues in cross-platform collaboration.
- **Effect**: Converts line endings to LF (`\n`) by default.

## 8. `trailing-whitespace`
- **Purpose**: Trims trailing spaces/tabs at line endings.
- **Why?** Invisible whitespace adds noise to diffs and can break formats.
- **Effect**: Automatically removes trailing whitespace.

---

### Summary Table
| Hook ID                   | Category       | Key Functionality                     |
|---------------------------|----------------|---------------------------------------|
| `fix-byte-order-marker`   | Formatting     | Removes UTF-8 BOM                     |
| `check-case-conflict`     | Safety         | Detects case-sensitive filename clashes |
| `check-merge-conflict`    | Safety         | Blocks unresolved merge conflicts     |
| `detect-aws-credentials`  | Security       | Prevents AWS credential leaks         |
| `detect-private-key`      | Security       | Blocks private key commits            |
| `end-of-file-fixer`       | Formatting     | Enforces trailing newlines            |
| `mixed-line-ending`       | Formatting     | Standardizes line endings             |
| `trailing-whitespace`     | Formatting     | Trims unnecessary whitespace          |

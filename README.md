# setup-kd

This actions sets up your GitHub Actions environment by installing [UKHomeOffice/kd](https://github.com/UKHomeOffice/kd) into a `bin` folder in the current workspace

# Usage

See [action.yml](action.yml)

Basic:
```yaml
steps:
  - uses: actions/checkout@v2
  - uses: ministryofjustice/setup-kd@main
  - run: bin/kd --file deployment.yml
```
# setup-kd

This actions sets up your GitHub Actions environment by installing [UKHomeOffice/kd](https://github.com/UKHomeOffice/kd) into it's `$PATH`

# Usage

See [action.yml](action.yml)

Basic:
```yaml
steps:
- uses: actions/checkout@v2
- uses: ministryofjustice/setup-kd@main
- run: kd --file deployment.yml
```
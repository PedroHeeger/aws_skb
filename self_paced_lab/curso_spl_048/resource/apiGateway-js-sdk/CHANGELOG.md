# Changelog

## (2024-05-20)

### Bug Fixes

* **deps:** update dependency `axios` from v0.7.0 to v0.28.1
* **deps:** update dependency CryptoJS from 3.1.2 to v4.2.0

### Upgrade Notes: `axios`

`axios` is used create signed requests and handle the responses from your API calls. We upgraded `axios` from version 0.7.0 to 0.28.1 which may introduce backwards incompatible changes in expected behavior depending on your usage of the `axios` response object.

Please review the [`axios` upgrade guide](https://github.com/axios/axios/blob/main/UPGRADE_GUIDE.md), the [`axios` change log](https://github.com/axios/axios/blob/main/CHANGELOG.md), and your usage of the API response objects to ensure that your API client usage continues to work as you expected.

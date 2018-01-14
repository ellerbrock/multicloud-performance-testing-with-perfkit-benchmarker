![multicloud performance testing](https://upload.wikimedia.org/wikipedia/commons/4/40/Alibaba-cloud-logo-grey-2-01.png)

# Multi Cloud Performance Testing [![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg)](https://github.com/ellerbrock/open-source-badges/) [![Gitter Chat](https://badges.gitter.im/frapsoft/frapsoft.svg)](https://gitter.im/frapsoft/frapsoft/) [![MIT Licence](https://badges.frapsoft.com/os/mit/mit.svg?v=103)](https://opensource.org/licenses/mit-license.php)

## Intro

To learn one tool and be able to reuse it in different environment is a big timesafer.
Just imagine instead of using Terraform you have to learn for each Cloud their own kind of way in doing Infrastructure as Code, would be a pain.

Since we nowadays also run quite often in a Multi Cloud Environment the same comes to Performance Testing. Google come up with a great Tool to Cover that called [PerfKitBenchmarker](https://github.com/GoogleCloudPlatform/PerfKitBenchmarker).

Instead of deep diving in all those different tools, setting them up, get them automated working and then even in multiple Clouds is already nicely solved and Open Sourced by Google - thanks for that!

With the usage of PerfKit Benchmarker you cover these Clouds:

- Google Cloud Platform
- AWS
- Azure
- AliCloud
- DigitalOcean
- Rackspace Cloud
- ProfitBricks

I had some problems with weird behavior of Python on my Mac and wrote a quick introduction how to fix it [here](https://github.com/ellerbrock/osx-python-pip-problems).

For the project setup i added a `install.sh` 
Since it's just a timesaver when having problems with Python just follow the install instruction on the repository.

To get a better overview i can recommend to check out this video on github where a Google guy explain how they use it: <https://youtu.be/9D1fVFpx57o>

## Bootstraping for Alibaba Cloud

```bash
#!/usr/bin/env bash

set -e

VERSION="1.13.0"

function main() {
  wget "https://github.com/GoogleCloudPlatform/PerfKitBenchmarker/archive/v${VERSION}.zip"
  unzip "v${VERSION}.zip"
  rm "v${VERSION}.zip"
  cd "PerfKitBenchmarker-${VERSION}"
  pip install --user pipenv
  pipenv install requests
  pipenv install -r requirements.txt


  # from here it's alibaba cloud specific
  pipenv install -r perfkitbenchmarker/providers/alicloud/requirements.txt
}

function benchmark() {
  # just an example how to run
  pipenv run python pkb.py \
      --cloud=AliCloud \
      --machine_type=ecs.sn1.medium \
      --zones=eu-central-1a \
      --benchmarks=iperf
}

main
```

## Support

You can get direct support for my Open Source projects on Alibaba Cloud here

[![gitter](https://github.frapsoft.com/top/gitter-alibabacloudnews.jpg)](https://gitter.im/alibabacloudnews/Lobby)


## Try Alibaba Cloud

[Sign up](http://ow.ly/YKQe30hHgp8) today and get $300 valid for the first 60 days to try Alibaba Cloud.


## Contact

[![Github](https://github.frapsoft.com/social/github.png)](https://github.com/ellerbrock/)[![Docker](https://github.frapsoft.com/social/docker.png)](https://hub.docker.com/u/ellerbrock/)[![npm](https://github.frapsoft.com/social/npm.png)](https://www.npmjs.com/~ellerbrock)[![Twitter](https://github.frapsoft.com/social/twitter.png)](https://twitter.com/frapsoft/)[![Facebook](https://github.frapsoft.com/social/facebook.png)](https://www.facebook.com/frapsoft/)[![Google+](https://github.frapsoft.com/social/google-plus.png)](https://plus.google.com/116540931335841862774)[![Gitter](https://github.frapsoft.com/social/gitter.png)](https://gitter.im/frapsoft/frapsoft/)

## License 

[![MIT license](https://badges.frapsoft.com/os/mit/mit-125x28.png?v=103)](https://opensource.org/licenses/mit-license.php)

This work by <a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/ellerbrock" property="cc:attributionName" rel="cc:attributionURL">Maik Ellerbrock</a> is licensed under a <a rel="license" href="https://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a> and the underlying source code is licensed under the <a rel="license" href="https://opensource.org/licenses/mit-license.php">MIT license</a>.

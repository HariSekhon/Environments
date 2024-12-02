# GCP Profiles

Set up [direnv](https://github.com/HariSekhon/Knowledge-Base/blob/main/direnv.md)
and then `cd` to these directories to automatically configure
your GCP environment variables `CLOUDSDK_CORE_PROJECT` and related environment setttings,
well as your GKE `kubectl` context.

Also automatically calls:

```shell
gcloud auth login
```

if you're not already logged in.

If you don't want it to automatically log you in with the usual SSO pop-up then set this in your environment:

```shell
export GCP_NO_AUTOLOGIN=1
```

Makes it easier to jump between GCP environments with a simple `cd` to the right directory.

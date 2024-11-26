# AWS Profiles

Set up [direnv](https://github.com/HariSekhon/Knowledge-Base/blob/main/direnv.md)
and then `cd` to these directories to automatically configure
your `AWS_PROFILE` and EKS kubectl context.

Also automatically calls:

```shell
aws sso login
```

if your AWS profile is an SSO profile and you're not already logged in.

If you don't want it to automatically log you in with the usual SSO pop-up then set this in your environment:

```shell
export AWS_NO_AUTOLOGIN=1
```

Makes it easier to jump between AWS environments with a simple `cd` to the right directory.

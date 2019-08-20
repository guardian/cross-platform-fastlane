# cross-platform-fastlane

## Usage

To use the [custom actions](https://docs.fastlane.tools/create-action/#local-actions) and lanes defined in this repo, include the following [import](https://docs.fastlane.tools/advanced/Fastfile/#importing-another-fastfile) at the top of your [`Fastfile`](https://docs.fastlane.tools/advanced/Fastfile/#fastfile): 

`import_from_git(url:"git@github.com:guardian/cross-platform-fastlane.git", path:"fastlane/Fastfile")`

This will allow you to run an action from this repo in the same way that you'd use a [built-in action](https://docs.fastlane.tools/actions/), for example:

```
post_to_google_chat(
  webhook_url: ENV["GOOGLE_CHAT_WEBHOOK_URL"],
  message: "iOS Release for version 1.0 (123) was successful!"
)
```


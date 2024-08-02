# Pipeline Notification

> The tool you've been waiting for

Get notified whenever your [gitlab-ci pipeline](https://about.gitlab.com/solutions/continuous-integration) starts, finishes, and what its result is (along with a quick-access link to its page)
This *should* compatible with every linux distro that is compatible with native notifications, using the notify-send command.

## Setup
This part is a bit long just for clarity, this should take 3 minutes tops
### Project ID
Open your gitlab project/repository in a new tab and perform the steps there
1. Visit your project page by clicking its' name at the left sidebar, just above `Pinned`
2. Click the `⋮` (three dots) on the right of your screen (next to the Fork button)
3. Click `Copy project ID:`, and SAVE this somewhere, this is your **ID**

### API Key
1. Click your profile picture in the top left, then click `Preferences`
3. In the sidebar, click `Access Tokens`
4. Click the `Add new token` button on the right
5. Pick a name, set the expiration date to far away in the future
6. Check ALL the checkboxes
7. Copy and SAVE the token generated (shown as ····), this is your **KEY**

## Runtime!
Open a new tab in your terminal: <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>T</kbd>
Make sure you're in the same folder as the script is

Run this line:
```sh
sh running.sh <ID> <KEY>
```
***Important:***  Replace `<ID>` with your own Project ID, and `<KEY>` with your own API Key

That's all! Any future pipelines on your repository should notify you on runs and results.

## Extras:
Open the `running.sh` file in your preferred text editor, and change the `SHORT_NOTIF`, `LONG_NOTIF` or `DEBUG` variables for more customization.
- `SHORT_NOTIF` is how many milliseconds the `pipeline running!` message appears for
- `LONG_NOTIF` is how many milliseconds the `pipeline success / failed` message appears for
- `DEBUG` can be set to blank in order to see the API GET results in your terminal.

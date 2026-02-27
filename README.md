# Propagate

Propagate is a native video player app for iOS and iPadOS, intended to replace the Quick Look video player in the Files app. 

The Quick Look feature in Files is good enough for most videos, but occasionally, you might want to open the video in Picture in Picture or view a list of recently viewed videos so you can jump back into the file you were viewing. Propagate addresses both of these issues. 

Propagate, by design, does not have a file browser. Instead, you open files via the Files app. (You can even set Propagate as the default video player by opening the Get Info pane of a video and choosing a default video app.) Once opened, Propagate will immediately begin playing the video in the iOS native video player — Liquid Glass and all. 

The native video player is the exact one used in the Files app, down to the controls and appearance. However, if you swipe up to go to the Home Screen, unlike the Files app, the video will continue playing in a Picture in Picture window, just as you would expect. Why Apple hasn’t added this feature to the native viewer is beyond me, but that’s what Propagate is for.

When you return to Propagate and exit the video player, the video is saved in the app for easy access. Just tap the video to play it again, or swipe it away to delete it. Videos are not transferred to Propagate — these are just bookmarks to the files in the Files app. This, again, works like Preview, giving you a quick way to watch recently viewed videos.

That’s all Propagate does. It enables Picture in Picture for videos through the native video player and displays a list of recently watched videos. It doesn’t open web videos or let you edit them — there are better apps, such as [Infuse](https://firecore.com/infuse), that do just that. It’s just a great way to watch videos from the Files app on your iPhone or iPad. 

Propagate works with any cloud provider you have set up in Files, such as iCloud Drive, Google Drive, or OneDrive, making it a great alternative to those apps if you don’t want to use their non-native video players. It does not include any trackers or ads, which you think would be obvious, but alas, most video player apps on the App Store have weird ad SDKs in them. *Why can’t anything on the internet be precious anymore?* 

### Build
Propagate is not available on the App Store because I think it’s too simple and probably wouldn’t clear App Review. You can, however, build the app for yourself. You don’t need a paid developer account, but one is recommended. Just run this command in your terminal, or ask [Claude](https://claude.ai) to do it for you: 

```
git clone https://github.com/EshuMarneedi/Propagate.git
```

You can override the Xcode settings for code signing: Open the project, click Propagate in the sidebar, click the Propagate target in the new pane, go to Signing and Capabilities, and change the team to None. Change nothing else. You should now be able to run Propagate on your device. (Again, you can optionally choose your own development team if you have a paid developer account.)

### Contributions
Propagate is not my job (I can’t believe this needs to be said), and I’m not a maintainer. As such, it is closed for contributions. You can fork the project and do anything you would like with it. More power to you. The code is available under an MIT License.

### A Note
Propagate was written almost entirely by Claude Opus 4.6, with plenty of help from me. I wrote it partially to understand how artificial intelligence chatbots can supplement or replace software engineers. It took about four hours to make this app with Claude. 

If I did not know how to write Swift code, I think I would’ve been done with the app in less than 10 minutes. If I did not have Claude, it would have taken me a few days of on-and-off work to get the app in working order. I think both of these statements are important to understanding the state of AI-assisted software engineering in 2026. 

This project has high-quality code. It is not merely functional — I think the code makes logical sense to an outsider. It’s well-written, safe, and free of egregious bugs. Claude’s first pass at the app, which took about three minutes to complete, was not like this. This pass is *good* because *I know* how to write decent SwiftUI code. Therefore, I think learning how to code — or even better, the fundamentals of computer science — is a highly valuable skill in this age of AI-assisted programming. 

Perhaps people don’t care about good or bug-free software anymore. Maybe the days of humans looking at code and trying to understand it are numbered. And it’s inevitable that the next version of Claude will make fewer mistakes than this one did. But LLMs will never be perfect — they are non-deterministic by nature. LLMs are a gift to software engineers that make coding faster, but I don’t think they should replace them. As such, I continue to prioritize great code above pure efficiency. Maybe that’s why I don’t work at OpenAI. 

As a programmer who takes pride in their ability to write good code without any help, I do feel guilty that I wrote this project using Claude, though, despite my contributions and prompting being responsible for the quality of the codebase. So, to absolve myself of some of the guilt, I’m open-sourcing this project in the hopes someone can learn from it or use it in their own human-written app. Programming is our craft, and I want to honor that craft. If this app or its code is useful to you, I’m glad. Glory to open-source. 

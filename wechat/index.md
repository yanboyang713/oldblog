# Installing Wechat Desktop Client in Ubuntu Linux

## Introduction
WeChat is a popular micro-messaging cross-platform app supporting text, image/videos, group chats with over 900 million active monthly users, mostly in China. Along with the basic messaging facilities, it also provides payment services in China to pay bills, order goods and services, transfer money and much more.

## Using WeChat on Linux desktop

Just as you saw for WhatsApp on Linux, WeChat can also be used via a web browser by scanning the QR code. That of course doesn’t provide a native desktop experience.

You have two ways to use WeChat on Linux:

+ Use a dedicated unofficial WeChat client
+ Use a generic messaging service aggregator like Franz or Rambox

The unofficial WeChat client known as electronic-chat is discontinued unfortunately. It is no longer developed but you could still use it in snap format. However, I recommend not using it.

## Method 1: Installing WeChat on Linux via Rambox Pro

Rambox Pro is another method that you can use to run WeChat on Linux. It is a workspace browser that allows you to run and manage as many applications as you want.

With this one, you cannot only run WeChat. But you can also run other applications like Discord, Airtable, Aol, Buffer, WhatsApp on Linux.

You can download and install Rambox Pro free of cost. Also, it comes with premium plans for advanced users. However, as long as you are running WeChat, the free plan is enough.

To get started with Rambox Pro, follow these steps:

At first, you have to install Rambox Pro. You can install it from the Desktop Software center, or you can run the below command:

```console
boyang:~$ sudo snap install ramboxpro
[sudo] password for yanboyang713: 
ramboxpro 1.4.1 from Rambox (ramboxapp✓) installed
```

Once installed, run the application from the menu, and it will ask you to sign up.
![](https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/rambox-pro-signup.png?w=800&ssl=1)

After signing up, hit the Home icon, and now you have to select WeChat.
![](https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/add-a-new-app.png?w=800&ssl=1)

Then click on the Add button.
![](https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/add-wechat-2.png?w=800&ssl=1)

Once done, you will get to see a QR code on your screen.
![](https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/scan-QR-code.png?w=800&ssl=1)

Scan the QR code from your smartphone’s WeChat app to log in to WeChat on your Linux machine.

## Method 2: Installing WeChat on Linux via Snap [Deprecated]

electronic-chat is a third party open source client for WeChat hosted on github. As you can see, the repository is archived and the project is no longer active.
Though the article has mentioned the steps, please avoid using this method.

You can use snap in your Linux distribution to install it:

```bash
sudo snap install electronic-wechat
```

This will install WeChat client. Once done, launch it from the menu by searching for WeChat.
![](https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/wechat.jpg?w=800&ssl=1)

When you launch it for the first time, it will ask you to scan QR code.
![](https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/scan-qr-code.jpg?w=800&ssl=1)

Select the option to Scan QR code from the app and you can use it from your Ubuntu system.

If at any moment, you are not satisfied and would rather prefer your phone to keep using WeChat, you can uninstall it using below command:

```bash
sudo snap remove electronic-wechat
```

That’s it. Enjoy WeChat on Linux desktop.



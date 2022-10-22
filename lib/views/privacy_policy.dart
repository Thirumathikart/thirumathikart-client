import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Privacy Policy'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Text(
                ' Privacy Policy ',
                style: TextStyle(
                    height: 3, fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0)),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  ''' 1. Collection of Personally Identifiable Information and other Information \n\n
When you use our Thirumathikart mobile application, we collect and store your personal information which is provided by you from time to time. Our primary goal in doing so is to provide you a safe, efficient, smooth and customized experience. This allows us to provide services and features that most likely meet your needs, and to customize our app to make your experience safer and easier.
In general, you can view the app without telling providing us your personal information. Once you give us your personal information, you are not anonymous to us. Where possible, we indicate which fields are mandatory and which fields are optional. We use this information to do internal research on our users’ demographics, interests, and behaviour to better understand, protect and serve our users. This information is compiled and analysed on an aggregated basis.
We also use cookies to allow you to enter your password less frequently during a session. Cookies can also help us provide information that is targeted to your interests. Most cookies are “session cookies,” meaning that they are automatically deleted from your hard drive at the end of a session. You are always free to decline our cookies if your browser permits, although in that case you may not be able to use certain features on the Website and you may be required to re-enter your password more frequently during a session.
If you choose to buy through online, we collect information about your buying behaviour.
If you transact with us, we collect some additional information, such as a billing address, a credit / debit card number and a credit / debit card expiration date and/ or other payment instrument details and tracking information from cheques or money orders.
If you send us personal correspondence, such as emails or letters, or if other users or third parties send us correspondence about your activities or postings on the Website, we may collect such information into a file specific to you.
We collect personally identifiable information (email address, name, phone number, credit card / debit card / other payment instrument details, etc.) from you when you set up a free account with us. While you can browse some sections of our app without being a registered member, certain activities (such as placing an order) do require registration. We do use your contact information to send you offers based on your previous orders and your interests. \n\n
2. Use of Demographic / Profile Data / Your Information \n\n
We use personal information to provide the services you request. To the extent we use your personal information to market to you we will provide you the ability to opt-out of such uses. We use your personal information to resolve disputes, troubleshoot problems, help promote a safe service, collect money, measure consumer interest in our products and services, inform you about online and offline offers, products, services, and updates, customize your experience, detect and protect us against error, fraud and other criminal activity, enforce our terms and conditions; and as otherwise described to you at the time of collection.
In our efforts to continually improve our product and service offerings, we collect and analyse demographic and profile data about our users’ activity on our Website.
We will occasionally ask you to complete optional online surveys. These surveys may ask you for contact information and demographic information (like zip code, age, or income level). We use this data to tailor your experience at our Website, providing you with content that we think you might be interested in and to display content according to your preferences. \n\n
Cookies \n\n
A “cookie” is a small piece of information stored by a web server on a web browser so it can be later read back from that browser. Cookies are useful for enabling the browser to remember information specific to a given user. We place both permanent and temporary cookies in your memory storage device. The cookies do not contain any of your personally identifiable information. \n\n
3. Sharing of personal information \n\n
We may share personal information with our other corporate entities and affiliates. These entities and affiliates may market to you as a result of such sharing unless you explicitly opt-out.
We may disclose personal information to third parties. This disclosure may be required for us to provide you access to our Services, to comply with our legal obligations, to enforce our User Agreement, to facilitate our marketing and advertising activities, or to prevent, detect, mitigate, and investigate fraudulent or illegal activities related to our Services. We do not disclose your personal information to third parties for their marketing and advertising purposes without your explicit consent.
We may disclose personal information if required to do so by law or in the good faith belief that such disclosure is reasonably necessary to respond to subpoenas, court orders, or other legal process. We may disclose personal information to law enforcement offices, third party rights owners, or others in the good faith belief that such disclosure is reasonably necessary to: enforce our Terms or Privacy Policy; respond to claims that an advertisement, posting or other content violates the rights of a third party; or protect the rights, property or personal safety of our users or the general public.
We and our affiliates will share / sell some or all of your personal information with another business entity should we (or our assets) plan to merge with, or be acquired by that business entity, or re-organization, amalgamation, restructuring of business. Should such a transaction occur that other business entity (or the new combined entity) will be required to follow this privacy policy with respect to your personal information. \n\n
4. Links to Other Sites/Apps \n\n
Our app links to other websites/app that may collect personally identifiable information about you. Thirumathikart is not responsible for the privacy practices or the content of those linked websites/Websites. \n\n
5. Security Precautions \n\n
Thirumathikart has stringent security measures in place to protect the loss, misuse, and alteration of the information under our control. Whenever you change or access your account information, we offer the use of a secure server. Once your information is in our possession we adhere to strict security guidelines, protecting it against unauthorized access. \n\n
6. Choice/Opt-Out \n\n
We provide all users with the opportunity to opt-out of receiving non-essential (promotional, marketing-related) communications from us on behalf of our partners, and from us in general, after setting up an account. If you want to remove your contact information from all our lists and newsletters, please visit unsubscribe. \n\n


7. Advertisements on the Website \n\n

We use third-party advertising companies to serve ads when you visit our Website. These companies may use information (not including your name, address, email address, or telephone number) about your visits to this and other websites/Websites in order to provide advertisements about goods and services of interest to you. \n\n

8. Your Consent \n\n

By using the app and/ or by providing your information, you consent to the collection and use of the information you disclose on the app in accordance with this Privacy Policy, including but not limited to Your consent for sharing your information as per this privacy policy.
If we decide to change our privacy policy, we will post those changes on this page (home page) so that you are always aware of what information we collect, how we use it, and under what circumstances we disclose it. \n\n

9. Grievance Officer \n\n

In accordance with Information Technology Act 2000 and rules made there under, contact details of the Grievance Officer are provided below:
E-mail: shgnitt@gmail.com \n\n

10. Jurisdiction \n\n
If any legal issue arises, the jurisdiction falls under the court of Tiruchirappalli. \n\n''',
                  style: TextStyle(height: 1.5, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      );
}

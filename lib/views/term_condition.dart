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
          title: const Text('Terms and Conditions'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Text(
                'Terms and Conditions',
                style: TextStyle(
                    height: 3, fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0)),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  ''' By using this application and/or placing an order, you agree to be bound by the terms and conditions set out below. Please also read our Privacy Policy regarding personal information provided by you. \n
 Copyright \n
 The entire content included in this application, including but not limited to text, graphics or code is copyrighted as a collective work under copyright laws, and is the property of Self-Help Groups. The collective work includes works that are licensed to THIRUMATHIKART. ALL RIGHT RESERVED.
 Permission is granted to electronically copy and print hard copy portions of this application for the sole purpose of placing an order with Thirumathikart or purchasing Thirumathikart products.
 You may display and, subject to any expressly stated restrictions or limitations relating to specific material, download or print portions of the material from the different areas of the site solely for your own non-commercial use, or to place an order with Thirumathikart or purchasing Thirumathikart products.
 Any other use, including but not limited to the reproduction, distribution, displayed transmission of the content of this site is strictly prohibited, unless authorized by Thirumathikart. You further agree not to change or delete any proprietary notices from materials downloaded from the site. \n

 Limitation of liability \n

 Thirumathikart shall not be liable for any special or consequential damages that result from the use of, or the inability to use, the materials on this site or the performance of the products, even if Thirumathikart has been advised of the possibility of such damages. Applicable law may not allow the limitation of exclusion of liability or incidental or consequential damages, so the above limitation or exclusion may not apply to you. \n

 Typographical errors

 While Thirumathikart strives to provide accurate product and pricing information, pricing or typographical errors may occur. Thirumathikart cannot confirm the price of an item until after you order. In the event that an item listed at an incorrect price or with incorrect information due to an error in pricing or product information, Thirumathikart shall have the right, at our sole discretion, to refuse or cancel any orders placed for that item. In the event that an item is priced incorrectly, Thirumathikart may, at our discretion, either contact you for instructions or cancel your order and notify you of such cancellation. \n

 Termination \n

 These terms and conditions are applicable to you upon your accessing the mobile application and/or completing the registration or shopping process. These terms and conditions, or any part of them, may be terminated by Thirumathikart without notice at any time, for any reason. Any termination of this agreement shall not affect the respective rights and obligations (including without limitation, payment obligations) of the parties arising before the date of termination. \n

 Use of site \n

 Harassment in any manner or form on the site, including via e-mail, chat, or by use of obscene or abusive language, is strictly forbidden. Impersonation of others, including a Thirumathikart or other licensed employee, host, or representative, as well as other members or visitors on the site is prohibited. You may not upload to, distribute, or otherwise publish through the site any content which is libellous, defamatory, obscene, threatening, invasive of privacy or publicity rights, abusive, illegal, or otherwise objectionable which may constitute or encourage a criminal offense, violate the rights of any part tor which may otherwise give rise to liability or violate any law. You may not upload commercial content on the site or use the site to solicit others to join or become members of any other commercial online service or other organization.

 Links \n

 In an attempt to provide increased value to our visitors, Thirumathikart may link to sites operated by third parties. However, even if the third party\'s affiliated with Thirumathikart, Thirumathikart has no control over the linked sites, all of which have separate privacy and data collection practices, independent of Thirumathikart.
 These linked sites are only for your convenience and therefore you are accessing them at your own risk. Nonetheless, Thirumathikart seeks to protect the integrity of the app and the links placed upon it. \n

 Different pricing currencies \n

 Pricing of products sold by Thirumathikart is based upon figures calculated in Rupees (₹).The price displayed on an individual product page, regardless of currency denomination, is the current price you are liable to pay to Thirumathikart, excluding shipping. \n

 1. TERMS AND CONDITIONS TO GOVERN - These terms and conditions represent the final and complete agreement of the parties and or conditions in anyway modifying or changing the provisions stated herein shall be binding upon Our Company unless made in writing and signed and approved by an officer or other authorized person at Our Company. No modification of any of these terms shall be modified by Our Company's shipment of goods following receipt of Buyers purchase order, shipping request or similar forms containing printed terms and conditions additional to or in conflict with the terms herein. If any term, clause or provision is declared to held invalid by a court of competent jurisdiction, such declaration or holding shall not affect the validity of any other term, clause or provision here in contained. \n

 2. ACCEPTANCE OF ORDERS - All orders are subject to written price verification by authorized Our Company personnel unless designated in writing to be firm for a specified period of time. Shipment of goods without written price verification does not constitute acceptance of the price contained in the order. \n

 3. SUBSTITUTION - Our Company reserves the right, without prior notification, to substitute an alternative product of like kind, quality and function. If the Buyer will not accept a substitute, the Buyer must specifically declare that no substitution is allowed when the buyer requests a quote, if such request for quote is made, or, if no request for quote was made, when placing an order with the Our Company. \n

 4. PRICE - Prices quoted, including any transportation charges, are valid for 10 days unless designated as firm for as pacific period pursuant to a written quote or written sales acceptance issued or verified by an officer or other authorized personnel of Our Company. A price designated as firm for a specific period may be revoked by Our Company if the revocation is in writing and is mailed to the Buyer prior to the time a written acceptance of the price is received by Our Company. Our Company reserves the right to cancel orders in the event selling prices which are lower than prices quoted are established by government regulations. \n

 5. TRANSPORTATION - Unless otherwise provided, Thirumathikart shall use it judgment in determining carrier and routing. In either case, Thirumathikart shall not be liable for any delays or excessive transportation charges resulting from its selection. \n

 6. PACKING - Unless otherwise provided, Thirumathikart will comply only with it is minimum packing standards for the method of transportation selected. The cost of all special packing, loading or bracing requested by Buyer will be paid for by Buyer. All cost of packing and shipment for Buyer's special equipment shall be paid for by Buyer. \n

 7. PAYMENT TERMS - The discount applies only to the invoiced value of the material (not to taxes or freight charges). Thirumathikart reserves the right to require advance payment or satisfactory security for the goods if the financial condition of Buyer so warrants as determined by Our Company. If Buyer fails to make payment in accordance with terms of this agreement or any collateral agreement, or fails to comply with any provisions hereof, Our Company may, at its option (and in addition to other remedies), cancel any unshipped portion of this order. Buyer is to remain liable for all unpaid accounts. \n

 8. TITLE AND RISK OF LOSS - Delivery to carrier shall constitute delivery to Buyer, and thereafter risk of loss or damage shall pass to Buyer. Any claim of Buyer relative to damage during shipping or delivery should be made directly to the carrier. Any claims by Buyer against Our Company for shortage or damage occurring prior to such delivery to carrier must be made within five (5) days after receipt of the goods and accompanied by original transportation bill signed by carrier noting that carrier received the goods from Our Company in the condition claimed. \n

 9. RETURN OF PRODUCTS - Goods cannot be returned in the initial version of the application. The updated version will allow the buyer to claim returning of products. For order cancellations, user can cancel their order at any time before its delivered. Once the order/product is delivered then the maximum time for order cancellation is one day from the date of delivery.

 10. FORCE MAJEURE - Thirumathikart shall not be liable for failure to perform its obligations resulting directly or indirectly from or contributed to by acts of God; acts of Buyer, civil or military authority, including wage and price controls; fires; war; riot; delays in transportation; lack of or inability too brain raw materials (including energy sources), components, labour, fuel or supplies; or other circumstances beyond Our Company\'s reasonable control, whether similar or dissimilar to the foregoing. If certain quantities are affected and other quantities are not, the quantities affected shall be eliminated without liability, but the agreement shall remain unaffected. Our Company may during any period of shortage due to any of said causes, allocate its supply of such raw materials among its various users thereof in any manner which we deem fair and reasonable. In no event shall Our Company be liable for special or consequential damages for any delay for any cause. \n

 11. LIABILITY - Our Company shall not be responsible, obligated, or liable for any injury or damage resulting from an application or use of its products, either singularly or in combination with other products, arising out of acceptance of this order. Our Company shall have no liability for errors in weight or quantity delivered unless claim is made by Buyer within five (5) days after receipt of shipment and accompanied by original transportation bill signed by carrier noting that carrier received the goods from Our Company in the condition claimed. If such timely claim is made by Buyer, and the claim is deemed valid by Our Company, Our Company may fulfil its responsibility by either shipping the quantity necessary to make good the deficiency, or at Our Company\'s option, crediting Buyer with the invoice price of the deficiency. \n
 12. WARRANTY - All goods sold by Our Company are warranted to Buyer to be free from defects in material and workmanship, and manufactured in accordance with industry standards. Any claimed defect in material or workmanship shall be deemed waived by Buyer unless submitted to Our Company in writing within five (5) days from the date the goods are received by Buyer. Our Company shall not be liable under the foregoing warranty if any loss or damage is caused by improper application or use of the goods. Our Company disclaims all liability with respect to the design of the goods and makes no warranty with respect to such design. This warranty is in lieu of and excludes all other warranties, whether express, implied, or statutory, including implied warranties of merchantability or fitness. \n
 13. REMEDIES AND LIMITATION OF LIABILITY - Our Company shall not be liable for incidental or consequential losses, damages, or expenses arising directly or indirectly from the sale, handling or use of the goods, or from any other cause relating there to. Our Company's liability, in any case, including for claims of breaches of warranty or negligence is exclusively limited, at Our Company\'s option, to the replacement of goods not complying with this agreement, the repayment of, or crediting Buyer with, an amount equal to the purchase price of such goods, or repairing or arranging for repair of the goods. \n
 14. JURISDICTION – If any legal issue arises, the jurisdiction falls under the court of Tiruchirappalli. \n\n''',
                  style: TextStyle(height: 1.5, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      );
}

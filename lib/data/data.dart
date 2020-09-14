// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:omnikit/models/content_model.dart';

import '../assets.dart';

final Content retailContent = Content(
  name: 'Comfort Max Generation 4',
  imageUrl: Assets.retailHero,
  title: 'Comfort Max Generation 4',
  // videoUrl: Assets.sintelVideoUrl,
  price: '\$99.99',
  description:
      'Amazing pair of sneakers that make you feel like you\'re walking on the clouds',

);

final List<Content> deals = const [
  Content(
    imageUrl: Assets.firewood,
    name: 'Cutting Edge Firewood Oak',
    color: Colors.orange,
    description:'Perfect Grade Firewood for keeping you and your family warm during the winter.It burns hotter and longer than cherry, but cooler and not as long as hickory. For many of our customers, oak is their first experience with our kiln dried firewood.',
    price: '\$49.0',
    // https://www.cuttingedgefirewood.com/product/box-of-oak-firewood/?utm_source=Google&utm_medium=cpc&utm_campaign=Shopping%20Boxes%20Firewood&gclid=CjwKCAjwyo36BRAXEiwA24CwGX6u0JKGKwwnHJQ2ocheVZ6K_vOykNx3YGeV2aOnut2R29WurWMYrRoC8woQAvD_BwE
  ),
  Content(
    imageUrl: Assets.paperTowel,
    name: 'Cleanly Jaunty Paper Towel',
    color: Colors.red,
    description:' 2X more absorbent* and strong when wet, so you can get the job done quickly. *vs. leading ordinary brand',
    price: '\$19.88',
    // https://www.walmart.com/ip/Bounty-Select-A-Size-Paper-Towels-White-12-Double-Rolls/260488518
  ),
  Content(
    name: 'Straight Fit Jeans',
    imageUrl: Assets.jeans,
    color: Colors.yellow,
    description:'Keep it straight and simple -- aka if it ain\'t broke, don\'t fix it. These classic straight-leg jeans are pretty much like the ones you loved back in the day',
    price: '\$15.88',
    //https://oldnavy.gap.com/browse/product.do?pid=339228022&vid=12#pdp-page-content
  ),
  Content(
    name: 'iPhone SE(2020)',
    imageUrl: Assets.phone,
    color: Colors.lightBlueAccent,
    description:'iPhone SE is the most powerful 4.7-inch iPhone ever. 1Featuring A13 Bionic, the fastest chip in a smartphone, for incredible performance in apps, games, and photography. Portrait mode for studio-quality portraits and six lighting effects. ',
    price: '\$19.88',
    //https://www.walmart.com/ip/AT-T-Apple-iPhone-SE-2020-64GB-White-Upgrade-Only/979697514
  ),
  Content(
    name: 'Corded Stick Vacuum HV300',
    imageUrl:Assets.vaccumCleaner ,
    color: Colors.green,
    description: 'Versatile Carpet and Bare Floor Cleaning.Deep-Cleans and Removes Pet Hair.',
    price: '\$198.88',
    //https://www.walmart.com/ip/Shark-Rocket-Corded-Stick-Vacuum-HV300/28919227
  ),
  Content(
    name: 'Laundry Detergent Pacs',
    imageUrl: Assets.detergent,
    color: Colors.orange,
    description: 'PODS consist of up to 90% active ingredients, so you can be sure that you’re paying for clean not for water',
    price: '\$19.88',
    //https://www.amazon.com/Tide-Laundry-Detergent-Spring-Meadow/dp/B01BUNHFQM?pf_rd_r=YRH2ESHQEFGFBS43JX4J&pf_rd_p=62c3d5b0-1b38-41b5-ac5c-f1a4b9e819fd&pd_rd_r=b5c7e344-81db-4b32-b3e4-5cee17ab25ac&pd_rd_w=tff6g&pd_rd_wg=VEBZB&ref_=pd_gw_bia_d0
  ),
  Content(
    name: 'Force 1 Shadow',
    imageUrl: Assets.f1Shoe,
    color: Colors.red,
    description: ' Shadow pays homage to the women who are setting an example for the next generation by being forces of change in their community',
    price: '\$49.88',
//https://www.nike.com/t/air-force-1-shadow-womens-shoe-kTgn9J/CI0919-107
  ),
];


final List<Content> originals = const [
  Content(name: 'Shawshank Redemption', imageUrl: Assets.okShawshankRedemption, price:'\$9.88',
  description:'',),
  Content(name: 'The GodFather', imageUrl: Assets.okGodfather, price:'\$9.88',
  description:'',),
  Content(name: 'The Dark Knight', imageUrl: Assets.okDarkknight, price:'\$9.88',
  description:'',),
  Content(name: 'Pulp Fiction', imageUrl: Assets.okPulpfiction,  price:'\$9.88',
  description:'',),
  Content(name: 'Schindler\'s List', imageUrl: Assets.okShindlerslist,  price:'\$9.88',
  description:'',),
  Content(name: 'LOTR - The Return of the King', imageUrl: Assets.okLotr,  price:'\$9.88',
  description:'',),
  Content(name: 'Fight Club', imageUrl: Assets.okFightclub,  price:'\$9.88',
  description:'',),
  Content(name: 'Forrest Gump', imageUrl: Assets.okForest,  price:'\$9.88',
  description:'',),
];

final List<Content> myList = const [
  Content(name: '3 Pcs unisex Kids Rainbow Face Mask', imageUrl: Assets.okChildFaceMask, price:'\$15.88',
  description: '3 Pcs unisex Kids Size Rainbow Print Variety Pack Face Mask for ChildrenReusable Comfortable Washable Made In USA masksReusable Comfy Breathable Outdoor Fashion Face Face Mask Made In the USASuitable for Children Ages 4 - 12Made of soft breathable PolySpandex3 Pcs unisex Kids Size Rainbow Print Variety Pack Face Mask for Children Reusable Comfortable Washable Made In USA masks'),
  Content(name: 'Men\'s Solar Sport', imageUrl: Assets.okWatch,price:'\$48.98',
  description:'Utilizing a unique Self-Charging solar power system, this sporty analog/digital combination model provides plenty of functionality.A host of features such as 48-city world time, 5 alarms, stopwatch and dual countdown timers make this a versatile timepiece for almost any sport outing'),
  Content(name: 'Waffle Maker', imageUrl: Assets.okWaffleMaker,price: '\$39.88',
  description:'Bakes one large traditional-style waffle with five-setting browning control. The round classic waffle maker has a regulated thermostat with red and green "ready to bake/ready to eat" indicator lights. It is easy to use and clean with non-stick baking plates. This waffle maker features a beautiful brushed stainless steel housing. The slim size will sit easily on counters and tables when it is time to make some breakfast. It also makes a useful addition to your cooking gear.'),
  Content(name: 'Wifi - 1 Pack - Mesh Router', imageUrl: Assets.okMeshRouter, price:'\$99.92',
  description: 'Wifi replaces your router and works with your modem and ISP, so you can stream, download and share without missing a beat.Compatible with 802.11ac Backward compatible with 802.11a/b/g/n networks, so you can easily upgrade. Up to 1.2 Gbps data transfer speed For fast, efficient operation. TX Beamforming technology Focuses signals directly to compatible wireless devices to help ensure dependable connectivity. 2 Gigabit Ethernet ports Offer a high-speed wired network connection and can be configured as WAN or LAN. Wi-Fi protected access Protects your network against hackers and eavesdroppers. Manage your family\'s Internet use Keep track of your family\'s screen time - pause the Internet on your kids\' devices at bedtime or during homework hours'),
  Content(name: 'Pods Pro', imageUrl: Assets.okPodsPro, price:'\$225.0',
  description: 'Active Noise Cancellation for immersive sound.Transparency mode for hearing and connecting with the world around you.A more customizable fit for all-day comfort.Sweat and water resistant'),
  Content(name: 'Digital Assistant', imageUrl: Assets.okDigitalAssistant, price:'\$254.88',
  description: 'Digital Assistant for the smart home. Ask and find answers to everyday questions. Fully WiFi Compatible. Compatible with other smart devices.'),
];
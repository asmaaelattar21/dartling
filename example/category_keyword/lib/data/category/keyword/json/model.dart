
// http://www.json.org/
// http://jsonformatter.curiousconcept.com/

// rename dartling to yourDomainName
// rename Skeleton to YourModelName
// do not change model or Model

// data/dartling/json/model.dart

var categoryKeywordModelJson = @'''
{
   "width":990,
   "lines":[
      {
         "box2box1Min":"0",
         "box1Name":"Category",
         "box1box2Min":"0",
         "box2Name":"Category",
         "category":"reflexive",
         "box2box1Id":false,
         "box2box1Name":"category",
         "box1box2Id":false,
         "box1box2Name":"categories",
         "box1box2Max":"N",
         "internal":true,
         "box2box1Max":"1"
      },
      {
         "box2box1Min":"1",
         "box1Name":"Keyword",
         "box1box2Min":"0",
         "box2Name":"Tag",
         "category":"relationship",
         "box2box1Id":true,
         "box2box1Name":"keyword",
         "box1box2Id":false,
         "box1box2Name":"tags",
         "box1box2Max":"N",
         "internal":true,
         "box2box1Max":"1"
      },
      {
         "box2box1Min":"1",
         "box1Name":"Category",
         "box1box2Min":"0",
         "box2Name":"Tag",
         "category":"relationship",
         "box2box1Id":true,
         "box2box1Name":"category",
         "box1box2Id":false,
         "box1box2Name":"tags",
         "box1box2Max":"N",
         "internal":false,
         "box2box1Max":"1"
      }
   ],
   "height":580,
   "boxes":[
      {
         "entry":true,
         "name":"Category",
         "x":123,
         "y":153,
         "width":80,
         "height":80,
         "items":[
            {
               "sequence":10,
               "category":"required",
               "name":"name",
               "type":"String",
               "init":""
            },
            {
               "sequence":20,
               "category":"identifier",
               "name":"namePath",
               "type":"String",
               "init":""
            }
         ]
      },
      {
         "entry":true,
         "name":"Keyword",
         "x":303,
         "y":201,
         "width":80,
         "height":80,
         "items":[
            {
               "sequence":10,
               "category":"identifier",
               "name":"word",
               "type":"String",
               "init":""
            }
         ]
      },
      {
         "entry":false,
         "name":"Tag",
         "x":113,
         "y":378,
         "width":80,
         "height":80,
         "items":[

         ]
      }
   ]
}
''';
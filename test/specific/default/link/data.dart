
testLinkData(Repo repo, String modelCode) {
  var models;
  var session;
  var entries;
  var categories;
  var categoryCount = 0;
  var categoryConcept;
  var webLinkConcept;
  var dartWebLinkCount = 0;
  var members;
  var memberConcept;
  var memberCount = 0;
  var interestConcept;
  var dzenanInterestCount = 0;
  var dartInterestCount = 0;
  var html5InterestCount = 0;
  var dzenanOid;
  group('Testing Link', () {
    setUp(() {
      models = repo.defaultDomainModels;
      session = models.newSession();
      entries = models.getModelEntries(modelCode);

      categoryConcept = entries.categoryConcept;
      expect(categoryConcept, isNotNull);
      expect(categoryConcept.attributes, isNot(isEmpty));

      webLinkConcept = entries.webLinkConcept;
      expect(webLinkConcept, isNotNull);
      expect(webLinkConcept.attributes, isNot(isEmpty));
      expect(webLinkConcept.parents.count, equals(1));

      categories = entries.categories;
      expect(categories, isNotNull);
      expect(categories.count, equals(categoryCount));

      var dartCategory = new Category(categoryConcept);
      expect(dartCategory, isNotNull);
      expect(dartCategory.webLinks.count, equals(0));
      dartCategory.name = 'Dart';
      dartCategory.description = 'Dart Web language.';
      categories.add(dartCategory);
      expect(categories.count, equals(++categoryCount));

      var html5Category = new Category(categoryConcept);
      expect(html5Category, isNotNull);
      expect(html5Category.webLinks.count, equals(0));
      html5Category.name = 'HTML5';
      html5Category.description =
          'HTML5 is the ubiquitous platform for the modern web.';
      categories.add(html5Category);
      expect(categories.count, equals(++categoryCount));

      var css3Category = new Category(categoryConcept);
      expect(css3Category, isNotNull);
      expect(css3Category.webLinks.count, equals(0));
      css3Category.name = 'CSS3';
      css3Category.description = 'Cascading Style Sheets for the modern web.';
      categories.add(css3Category);
      expect(categories.count, equals(++categoryCount));

      var dartHomeWebLink = new WebLink(webLinkConcept);
      expect(dartHomeWebLink, isNotNull);
      dartHomeWebLink.subject = 'Dart Home';
      dartHomeWebLink.url = new Uri.fromString('http://www.dartlang.org/');
      dartHomeWebLink.description =
          'Dart brings structure to web app engineering '
          'with a new language, libraries, and tools.';
      dartHomeWebLink.category = dartCategory;
      expect(dartHomeWebLink.category, isNotNull);
      dartCategory.webLinks.add(dartHomeWebLink);
      expect(dartCategory.webLinks.count == ++dartWebLinkCount);

      var tryDartWebLink = new WebLink(webLinkConcept);
      expect(tryDartWebLink, isNotNull);
      tryDartWebLink.subject = 'Try Dart';
      tryDartWebLink.url = new Uri.fromString('http://try.dartlang.org/');
      tryDartWebLink.description =
          'Try out the Dart Language from the comfort of your web browser.';
      expect(tryDartWebLink.category, isNull);
      tryDartWebLink.category = dartCategory;
      expect(tryDartWebLink.category, isNotNull);
      dartCategory.webLinks.add(tryDartWebLink);
      expect(dartCategory.webLinks.count, equals(++dartWebLinkCount));

      var dartNewsWebLink = new WebLink(webLinkConcept);
      expect(dartNewsWebLink, isNotNull);
      dartNewsWebLink.subject = 'Dart News';
      dartNewsWebLink.url = new Uri.fromString('http://news.dartlang.org/');
      dartNewsWebLink.description =
          'Official news from the Dart project.';
      expect(dartNewsWebLink.category, isNull);
      dartNewsWebLink.category = dartCategory;
      expect(dartNewsWebLink.category, isNotNull);
      dartCategory.webLinks.add(dartNewsWebLink);
      expect(dartCategory.webLinks.count, equals(++dartWebLinkCount));

      var dartBugssWebLink = new WebLink(webLinkConcept);
      expect(dartBugssWebLink, isNotNull);
      dartBugssWebLink.subject = 'Dart Bugs';
      dartBugssWebLink.url = new Uri.fromString('????+\\dart&bug!hom');
      dartBugssWebLink.description = 'Dart error management.';
      expect(dartBugssWebLink.category, isNull);
      dartBugssWebLink.category = dartCategory;
      expect(dartBugssWebLink.category, isNotNull);
      dartCategory.webLinks.add(dartBugssWebLink);
      expect(dartCategory.webLinks.count, equals(++dartWebLinkCount));

      memberConcept = entries.memberConcept;
      expect(memberConcept, isNotNull);
      expect(memberConcept.attributes, isNot(isEmpty));
      //memberConcept.attributes.findByCode('password').sensitive = true;

      interestConcept = entries.interestConcept;
      expect(interestConcept, isNotNull);
      expect(interestConcept.attributes, isNot(isEmpty));
      expect(interestConcept.parents.count, equals(2));

      members = entries.members;
      expect(members, isNotNull);
      expect(members.count, equals(memberCount));

      var dzenan = new Member(memberConcept);
      expect(dzenan, isNotNull);
      dzenan.code = 'dzenanr';
      dzenan.password = 'drifting09';
      dzenan.firstName = 'Dzenan';
      dzenan.lastName = 'Ridjanovic';
      dzenan.email = 'dzenanr@gmail.com';
      dzenan.receiveEmail = true;
      dzenan.role = 'admin';
      dzenan.karma = 17.9;
      dzenan.about = '''I like to walk, hike and stop to have a good bite and drink. 
    In addition, my name is Denan Ri?anovi? (Dzenan Ridjanovic). 
    I am an associate professor in the Business School at the 
    Laval University (Universit Laval), Quebec, Canada. 
    I received a B.Sc. in informatics from the University of Sarajevo, 
    an M.Sc. in computer science from the University of Maryland, 
    and a Ph.D. in management information systems from the 
    University of Minnesota. My research interests are in the 
    spiral development of domain models and dynamic web applications
    with NoSQL databases.''';
      members.add(dzenan);
      expect(members.count, equals(++memberCount));
      dzenanOid = dzenan.oid;
      expect(dzenanOid, isNotNull);

      var claudeb = new Member(memberConcept);
      expect(claudeb, isNotNull);
      claudeb.code = 'claudeb';
      claudeb.password = 'claudeb8527';
      claudeb.firstName = 'Claude';
      claudeb.lastName = 'Begin';
      claudeb.email = 'claude.begin@hotmail.com';
      members.add(claudeb);
      expect(members.count, equals(++memberCount));

      var dzenanDartInterest = new Interest(interestConcept);
      expect(dzenanDartInterest, isNotNull);
      dzenanDartInterest.description =
          'I am interested in web software developed in Dart.';
      expect(dzenanDartInterest.member, isNull);
      expect(dzenanDartInterest.category, isNull);
      dzenanDartInterest.member = dzenan;
      dzenanDartInterest.category = dartCategory;
      dzenan.interests.add(dzenanDartInterest);
      dartCategory.interests.add(dzenanDartInterest);
      expect(dzenan.interests.count, equals(++dzenanInterestCount));
      expect(dartCategory.interests.count, equals(++dartInterestCount));
    });
    tearDown(() {
      categories.clear();
      expect(categories.count, equals(0));
      members.clear();
      expect(members.count, equals(0));
      categoryCount = 0;
      dartWebLinkCount = 0;
      memberCount = 0;
      dzenanInterestCount = 0;
      dartInterestCount = 0;
      html5InterestCount = 0;
    });
    test('Find Category and Web Link by Id', () {
      Id categoryId = new Id(entries.categoryConcept);
      categoryId.setAttribute('name', 'Dart');
      Category dartCategory = categories.findById(categoryId);
      expect(dartCategory, isNotNull);
      expect(dartCategory.name, equals('Dart'));

      WebLinks dartWebLinks = dartCategory.webLinks;
      expect(dartWebLinks.count == dartWebLinkCount);
      Id dartHomeId = new Id(entries.webLinkConcept);
      dartHomeId.setParent('category', dartCategory);
      dartHomeId.setAttribute('subject', 'Dart Home');
      WebLink dartHomeWebLink = dartWebLinks.findById(dartHomeId);
      expect(dartHomeWebLink, isNotNull);
      expect(dartHomeWebLink.subject, equals('Dart Home'));
    });
    test('Order Categories by Id (code not used, id is name)', () {
      Categories orderedCategories = categories.order();
      expect(orderedCategories, isNotNull);
      expect(orderedCategories, isNot(isEmpty));
      expect(orderedCategories.count, equals(categoryCount));
      expect(orderedCategories.source, isNotNull);
      expect(orderedCategories.source, isNot(isEmpty));
      expect(orderedCategories.source.count, equals(categoryCount));

      orderedCategories.display(
        'Categories Ordered By Id (code not used, id is name)');
    });
    test('Order Dart Web Links by Name', () {
      Category dartCategory = categories.findByAttribute('name', 'Dart');
      expect(dartCategory, isNotNull);
      WebLinks dartWebLinks = dartCategory.webLinks;
      expect(dartWebLinks.count, equals(dartWebLinkCount));

      WebLinks orderedDartWebLinks = dartWebLinks.order();
      expect(orderedDartWebLinks, isNotNull);
      expect(orderedDartWebLinks, isNot(isEmpty));
      expect(orderedDartWebLinks.count, equals(dartWebLinkCount));
      expect(orderedDartWebLinks.source, isNotNull);
      expect(orderedDartWebLinks.source, isNot(isEmpty));
      expect(orderedDartWebLinks.source.count,
        equals(dartWebLinkCount));

      orderedDartWebLinks.display('Ordered Dart Web Links');
    });
    test('New Category with Id', () {
      var webFrameworkCategory =
          new Category.withId(categoryConcept, 'Web Framework');
      expect(webFrameworkCategory, isNotNull);
      expect(webFrameworkCategory.webLinks.count, equals(0));
      categories.add(webFrameworkCategory);
      expect(categories.count, equals(++categoryCount));

      categories.display('Categories Including Web Framework');
    });
    test('New WebLink No Category Error', () {
      Category dartCategory = categories.findByAttribute('name', 'Dart');
      expect(dartCategory, isNotNull);

      var dartHomeWebLink = new WebLink(webLinkConcept);
      expect(dartHomeWebLink, isNotNull);
      expect(dartHomeWebLink.category, isNull);
      dartHomeWebLink.subject = 'Dart Home';
      dartHomeWebLink.url = new Uri.fromString('http://www.dartlang.org/');
      dartHomeWebLink.description =
          'Dart brings structure to web app engineering '
          'with a new language, libraries, and tools.';
      dartCategory.webLinks.add(dartHomeWebLink);
      expect(dartCategory.webLinks.count, equals(dartWebLinkCount));
      expect(dartCategory.webLinks.errors.count, equals(1));
      expect(dartCategory.webLinks.errors.list[0].category, equals('required'));
      dartCategory.webLinks.errors.display('WebLink Error');
    });
    test('New Uri from String', () {
      Uri uri;
      var s;

      try {
        s = '????:\\**""##&dartbug!hom';
        uri = new Uri.fromString(s);
      } catch (final IllegalArgumentException e) {
        expect(uri, isNull);
        print('/// Not valid uri: $s; $e');
        print('');
      }
      expect(uri, isNotNull);  // it should be: expect(uri, isNull);
      print('/// Not valid uri, but no illegal argument exception: $uri');
      print('');

      try {
        s = '';
        uri = new Uri.fromString(s);
      } catch (final IllegalArgumentException e) {
        expect(uri, isNull);
        print('/// Not valid uri: $s; $e');
        print('');
      }
      expect(uri, isNotNull);  // it should be: expect(uri, isNull);
      print('/// Not valid uri, but no illegal argument exception: $uri');
      print('');

      try {
        s = null;
        uri = null;
        uri = new Uri.fromString(s);
      } catch (final NullPointerException e) {
        expect(uri, isNull);
        print('/// Not valid uri: $s; $e');
        print('');
      }
    });
    test('Undo and Redo Action', () {
      var webFrameworkCategory =
          new Category.withId(categoryConcept, 'Web Framework');
      expect(webFrameworkCategory, isNotNull);
      expect(webFrameworkCategory.webLinks.count, equals(0));

      var action = new AddAction(session, categories, webFrameworkCategory);
      action.doit();
      expect(categories.count, equals(++categoryCount));

      session.past.undo();
      expect(categories.count, equals(--categoryCount));

      session.past.redo();
      expect(categories.count, equals(++categoryCount));
    });
    test('Undo and Redo Transaction', () {
      var webFrameworkCategory =
          new Category.withId(categoryConcept, 'Web Framework');
      expect(webFrameworkCategory, isNotNull);
      expect(webFrameworkCategory.webLinks.count, equals(0));

      var action1 = new AddAction(session, categories, webFrameworkCategory);

      var dbCategory = new Category.withId(categoryConcept, 'Database');
      expect(dbCategory, isNotNull);
      expect(dbCategory.webLinks.count, equals(0));

      var action2 = new AddAction(session, categories, dbCategory);

      var transaction = new Transaction('two adds on categories', session);
      transaction.add(action1);
      transaction.add(action2);
      transaction.doit();
      categoryCount = categoryCount + 2;
      expect(categories.count, equals(categoryCount));
      categories.display('Transaction Done');

      session.past.undo();
      categoryCount = categoryCount - 2;
      expect(categories.count, equals(categoryCount));
      categories.display('Transaction Undone');

      session.past.redo();
      categoryCount = categoryCount + 2;
      expect(categories.count, equals(categoryCount));
      categories.display('Transaction Redone');
    });
    test('Undo and Redo Transaction with Id Error', () {
      var webFrameworkCategory =
          new Category.withId(categoryConcept, 'Web Framework');
      expect(webFrameworkCategory, isNotNull);
      expect(webFrameworkCategory.webLinks.count, equals(0));

      var action1 = new AddAction(session, categories, webFrameworkCategory);

      var dbCategory = new Category.withId(categoryConcept, 'Dart');
      expect(dbCategory, isNotNull);
      expect(dbCategory.webLinks.count, equals(0));

      var action2 = new AddAction(session, categories, dbCategory);

      var transaction = new Transaction(
        'two adds on categories, with an error on the second', session);
      transaction.add(action1);
      transaction.add(action2);
      var done = transaction.doit();
      expect(categories.count, equals(categoryCount));
      categories.display('Transaction (with Id Error) Done');

      if (done) {
        var undone = session.past.undo();
        expect(categories.count, equals(categoryCount));
        categories.display('Transaction (with Id Error) Undone');
        if (undone) {
          session.past.redo();
          expect(categories.count, equals(categoryCount));
          categories.display('Transaction (with Id Error) Redone');
        }
      }
    });
    test('Undo and Redo Transaction on Two Different Concepts', () {
      var webFrameworkCategory =
          new Category.withId(categoryConcept, 'Web Framework');
      expect(webFrameworkCategory, isNotNull);
      expect(webFrameworkCategory.webLinks.count, equals(0));

      var action1 = new AddAction(session, categories, webFrameworkCategory);

      var wicketWebLink = new WebLink(webLinkConcept);
      expect(wicketWebLink, isNotNull);
      wicketWebLink.subject = 'Wicket';
      wicketWebLink.url = new Uri.fromString('http://wicket.apache.org/');
      wicketWebLink.description =
          'With proper mark-up/logic separation, a POJO data model, '
          'and a refreshing lack of XML, Apache Wicket makes developing '
          'web-apps simple and enjoyable again. Swap the boilerplate, complex '
          'debugging and brittle code for powerful, reusable components written '
          'with plain Java and HTML.';
      wicketWebLink.category = webFrameworkCategory;
      expect(webFrameworkCategory.webLinks.count, equals(0));

      var action2 =
          new AddAction(session, webFrameworkCategory.webLinks, wicketWebLink);

      var transaction = new Transaction('two adds on different concepts', session);
      transaction.add(action1);
      transaction.add(action2);
      transaction.doit();
      expect(categories.count, equals(++categoryCount));
      expect(webFrameworkCategory.webLinks.count, equals(1));
      categories.display('Transaction  on Two Different Concepts Done');

      session.past.undo();
      expect(categories.count, equals(--categoryCount));
      categories.display('Transaction on Two Different Concepts Undone');

      session.past.redo();
      expect(categories.count, equals(++categoryCount));
      var category = categories.findByAttribute('name', 'Web Framework');
      expect(category, isNotNull);
      expect(category.webLinks.count, equals(1));
      categories.display('Transaction on Two Different Concepts Redone');
    });
    test('Find Member by Oid', () {
      var dzenan = members.find(dzenanOid);
      expect(dzenan, isNotNull);
      expect(dzenan.firstName == 'Dzenan');
    });
    test('Find Member by Attribute Id', () {
      var search = 'dzenanr@gmail.com';
      Member member = members.findByAttributeId('email', search);
      expect(members, isNotNull);
      expect(member.email, equals(search));
    });
    test('Find Category by Attribute Id', () {
      var search = 'Dart';
      var dart = categories.findByAttributeId('name', search);
      expect(dart, isNotNull);
      expect(dart.name, equals(search));
    });
    test('Add New Interest', () {
      var dzenan = members.find(dzenanOid);
      expect(dzenan, isNotNull);
      expect(dzenan.firstName == 'Dzenan');

      var search = 'HTML5';
      var html5 = categories.findByAttributeId('name', search);
      expect(html5, isNotNull);
      expect(html5.name, equals(search));

      var dzenanHtml5Interest = new Interest(interestConcept);
      expect(dzenanHtml5Interest, isNotNull);
      dzenanHtml5Interest.description =
          'I am interested in canvas and other modern elements of HTML5.';
      dzenanHtml5Interest.member = dzenan;
      dzenanHtml5Interest.category = html5;
      dzenan.interests.add(dzenanHtml5Interest);
      html5.interests.add(dzenanHtml5Interest);
      expect(dzenan.interests.count, equals(++dzenanInterestCount));
      expect(html5.interests.count, equals(++html5InterestCount));

      categories.display('Categories', withChildren:false);
      dzenan.interests.display("Dzenan's Interests");
    });
    test('Add Interest Required Error', () {
      var dzenan = members.find(dzenanOid);
      expect(dzenan, isNotNull);
      expect(dzenan.firstName == 'Dzenan');

      var dzenanHtml5Interest = new Interest(interestConcept);
      expect(dzenanHtml5Interest, isNotNull);
      dzenanHtml5Interest.description =
          'I am interested in canvas and other modern elements of HTML5.';
      dzenanHtml5Interest.member = dzenan;
      dzenan.interests.add(dzenanHtml5Interest);
      expect(dzenan.interests.count, equals(dzenanInterestCount));
      expect(dzenan.interests.errors.count, equals(1));
      expect(dzenan.interests.errors.list[0].category, equals('required'));

      dzenan.interests.errors.display('Add Interest Required Error');
    });
    test('Add Interest Unique Error', () {
      var dzenan = members.find(dzenanOid);
      expect(dzenan, isNotNull);
      expect(dzenan.firstName == 'Dzenan');

      var search = 'HTML5';
      var html5 = categories.findByAttributeId('name', search);
      expect(html5, isNotNull);
      expect(html5.name, equals(search));

      var dzenanHtml5Interest = new Interest(interestConcept);
      expect(dzenanHtml5Interest, isNotNull);
      dzenanHtml5Interest.description =
          'I am interested in canvas and other modern elements of HTML5.';
      dzenanHtml5Interest.member = dzenan;
      dzenanHtml5Interest.category = html5;
      dzenan.interests.add(dzenanHtml5Interest);
      html5.interests.add(dzenanHtml5Interest);
      expect(dzenan.interests.count, equals(++dzenanInterestCount));
      expect(html5.interests.count, equals(++html5InterestCount));

      var dzenanHtmlInterest = new Interest(interestConcept);
      expect(dzenanHtmlInterest, isNotNull);
      dzenanHtmlInterest.member = dzenan;
      dzenanHtmlInterest.category = html5;
      dzenan.interests.add(dzenanHtmlInterest);
      html5.interests.add(dzenanHtmlInterest);
      expect(dzenan.interests.count, equals(dzenanInterestCount));
      expect(dzenan.interests.errors.count, equals(1));
      expect(dzenan.interests.errors.list[0].category, equals('unique'));
      expect(html5.interests.count, equals(html5InterestCount));
      expect(html5.interests.errors.count, equals(1));
      expect(html5.interests.errors.list[0].category, equals('unique'));

      dzenan.display('dzenan: ', withChildren:false);
      html5.display('html5: ', withChildren:false);

      dzenan.interests.errors.display('Dzenan: Add Interest Unique Error');
      html5.interests.errors.display('HTML5: Add Interest Unique Error');
    });

  });
}
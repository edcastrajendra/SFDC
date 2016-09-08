public class SalesUniversity_Edcast {
   
    public String channelId{set;get;}
    public String jsonCDN{set;get;}
    public OrgInfoDto dto{set;get;}
    public String mileStoneXML{set;get;}
    public String quizXml{set;get;}
    public String folderId{set;get;}
    public String quizFilName{set;get;}
    public String parentid{set;get;}
    public String questionid{set;get;}
    public String correctoption{set;get;}
    public String questionfilecombo{set;get;}
    public String subkey{set;get;}
    public String oauthtoken{set;get;}
    public String ismandatory{set;get;}
    public boolean firstframe = false;
    public Integer currectanswer = -1;
    Integer count = 1;
    Integer index = -1;
    Integer firstIndex = 0;
    public Integer quizCount{set;get;}
    public Integer correctAnswerCount = 0;
    public String data{set;get;}
    public rss rss{set;get;}
    public List<Item> milestonelist {set;get;}
    public List<Quiz> quizlist{set;get;}
    public String containerid{set;get;}
    public String taskcontainerid{set;get;}
    public String taskId{set;get;}
    public String setProgress{set;get;}
    public String getProgress{set;get;}
    public List<String> getTaskId{set;get;}
    public List<String> mandatoryTaskId{set;get;}
    public Integer milestoneSize;
    public Integer submilestoneSize=0;
    public Integer countmandatory=0;
    public Integer countTask=0;
    public Integer countCompleteTask=0;
    public Boolean submilestonestatus;
    public String status{set;get;}
    public String videoStatus{set;get;}
    public String tutorialStatus{set;get;}
    public String workbookStatus{set;get;}
    public String quizStatus{set;get;}
    public String loginId{set;get;}
    public String jsondata{set;get;}
    public String visitTaskId{set;get;}
    public String milestonestatus{set;get;}
    public Integer countcompletesubmilestone{set;get;}
    public Integer totalsubmilestone{set;get;} 
    public Boolean quizResult=false;
    public Integer quizPercentage{set;get;}
    public boolean failResult{set;get;}
    public boolean passResult{set;get;}
    public SalesUniversity_Edcast(){
          visitTaskId='';
           jsonCDN = new CallingWebServices().getCdnData();
           jsonCDN = '{ \"orginfo\": { \"id\": \"1\", \"orgname\": \"WAGmob\", \"orgalias\": \"NA\", \"discription\": \"NA\", \"appkey\": \"508d67f4-4b39-11e5-aed8-f891effb198d\", \"isactive\": \"1\", \"orderno\": \"1\", \"orgbackground\": \"NA\", \"orgimage\": \"org_1.jpg\", \"googleclientid\": \"703927767716-8l77vgennu6mphl0epq61mn5qujfo5a5.apps.googleusercontent.com\", \"libraryinfo\": { \"id\": \"2\", \"libraryid\": \"2\", \"libtitle\": \"Sales University \", \"xmlversion\": \"1\", \"libraryxml\": \"NA\", \"bgimage\": \"NA\", \"splash\": \"gst_splash.png\", \"libimg\": \"gst_main.png\", \"libtype\": \"GST\", \"discription\": \"Sales University\", \"librarykey\": \"c9c5b2aa-76bb-11e4-859a-100b06fee687\", \"isactive\": \"1\", \"orderno\": \"2\", \"organizationid\": \"1\", \"librarybackground\": \"NA\", \"channelinfo\": [ { \"id\": \"83\", \"channelid\": \"83\", \"channeltitle\": \"Basics\", \"channelimage\": \"basics.png\", \"version\": \"1\", \"background\": \"NA\", \"showpattern\": \"ZigZag\", \"channelxml\": \"NA\", \"channelurl\": \"basics\", \"channelkey\": \"53912c00-2ae2-11e5-9d6c-55f2bfe645a2\", \"channelbackground\": \"NA\", \"orderno\": \"1\", \"libraryid\": \"2\", \"isactive\": \"1\", \"subjectinfo\": [ { \"id\": \"5\", \"subjectid\": \"5\", \"subjectname\": \"Sales Training by Robert Terson\", \"channelid\": \"83\", \"version\": \"1\", \"subjectxml\": \"windows_category.xml\", \"showpattern\": \"ZigZag\", \"ismandatory\": \"0\", \"prerequisitesid\": \"0\", \"title\": \"Sales Training by Robert Terson\", \"keyword\": \"Sales Training by Robert Terson\", \"description\": \"NA\", \"longdescription\": \"Sales Training by Robert Terson\", \"imageview\": \"sub224.png\", \"splashview\": \"splash224.png\", \"isshowsplash\": \"1\", \"trainername\": \"Robert Terson\", \"founder\": \"Sales Training by Robert Terson\", \"subjectnameforurl\": \"robert\", \"subjectimage\": \"sub1248.png\", \"subkey\": \"c9c5b2aa-76bb-11e4-859a-100b06fee687\", \"orderno\": \"5\", \"isactive\": \"1\", \"uniquefolderid\": \"224\", \"channeltype\": \"GST\", \"cdntype\": \"1\", \"innerlogintype\": \"4\", \"leaderboardflag\": \"true\", \"communityflag\": \"false\", \"readonlymodeflag\": \"false\", \"defaultviewtype\": \"grid\", \"BottomLogoFlag\": \"false\", \"quizbasetype\": \"htmlbase\", \"rightslider\": \"true\", \"mentormenteeflag\": \"false\" }, { \"id\": \"32\", \"subjectid\": \"32\", \"subjectname\": \"The Fundamentals of a Successful Sales Career by Tom Hopkins\", \"channelid\": \"83\", \"version\": \"1\", \"subjectxml\": \"windows_category.xml\", \"showpattern\": \"ZigZag\", \"ismandatory\": \"0\", \"prerequisitesid\": \"0\", \"title\": \"The Fundamentals of a Successful Sales Career by Tom Hopkins\", \"keyword\": \"The Fundamentals of a Successful Sales Career by Tom Hopkins\", \"description\": \"NA\", \"longdescription\": \"The Fundamentals of a Successful Sales Career by Tom Hopkins\", \"imageview\": \"subg132.png\", \"splashview\": \"splash132.png\", \"isshowsplash\": \"1\", \"trainername\": \"Tom Hopkins\", \"founder\": \"The Fundamentals of a Successful Sales Career by Tom Hopkins\", \"subjectnameforurl\": \"tom\", \"subjectimage\": \"subg132.png\", \"subkey\": \"b5e1791a-b764-11e4-8f4e-8a3b88f84675\", \"orderno\": \"1\", \"isactive\": \"1\", \"uniquefolderid\": \"132\", \"channeltype\": \"GST\", \"cdntype\": \"1\", \"cdnurl\": \"https://storage.googleapis.com/cdn.wagmob.com/gst/subject/\", \"innerlogintype\": \"4\", \"leaderboardflag\": \"true\", \"communityflag\": \"false\", \"readonlymodeflag\": \"false\", \"defaultviewtype\": \"grid\", \"BottomLogoFlag\": \"false\", \"quizbasetype\": \"htmlbase\", \"rightslider\": \"true\", \"mentormenteeflag\": \"false\" }, { \"id\": \"33\", \"subjectid\": \"33\", \"subjectname\": \"Proactive Prospecting with Tibor Shanto\", \"channelid\": \"83\", \"version\": \"1\", \"subjectxml\": \"windows_category.xml\", \"showpattern\": \"ZigZag\", \"ismandatory\": \"0\", \"prerequisitesid\": \"0\", \"title\": \"Proactive Prospecting with Tibor Shanto\", \"keyword\": \"Proactive Prospecting with Tibor Shanto\", \"description\": \"NA\", \"longdescription\": \"Proactive Prospecting with Tibor Shanto\", \"imageview\": \"subg133.png\", \"splashview\": \"splash133.png\", \"isshowsplash\": \"1\", \"trainername\": \"Tibor Shanto\", \"founder\": \"Proactive Prospecting with Tibor Shanto\", \"subjectnameforurl\": \"tibor\", \"subjectimage\": \"subg133.png\", \"subkey\": \"33402dd0-be44-11e4-b754-faa754af722c\", \"orderno\": \"1\", \"isactive\": \"1\", \"uniquefolderid\": \"133\", \"channeltype\": \"GST\", \"cdntype\": \"1\", \"cdnurl\": \"https://storage.googleapis.com/cdn.wagmob.com/gst/subject/\", \"innerlogintype\": \"4\", \"leaderboardflag\": \"true\", \"communityflag\": \"false\", \"readonlymodeflag\": \"false\", \"defaultviewtype\": \"grid\", \"BottomLogoFlag\": \"false\", \"quizbasetype\": \"htmlbase\", \"rightslider\": \"true\", \"mentormenteeflag\": \"false\" }, { \"id\": \"79\", \"subjectid\": \"79\", \"subjectname\": \"Sales Management Training by Ken Thoreson\", \"channelid\": \"83\", \"version\": \"1\", \"subjectxml\": \"windows_category.xml\", \"showpattern\": \"ZigZag\", \"ismandatory\": \"0\", \"prerequisitesid\": \"0\", \"title\": \"Sales Management Training by Ken Thoreson\", \"keyword\": \"Sales Management Training by Ken Thoreson\", \"description\": \"Ignite Your Sales Team: Sales Management on Fire!\\n\\nSales Leadership On Line Training Programs by Acumen Management Group\\nCorporate Licenses Available \\n\\nNOTE: Sales Management Tool Kit recommendation\\nResource Center: To take full advantage of these training programs and implement Kenâ€™s recommendations, you will want to subscribe to Acumenâ€™s Sales Management Tool Kit, a robust library of 40+ sales management resources http://www.acumenmgmt.com/Store and his blog: www.YourSalesManagementGuru.com\", \"longdescription\": \"Sales Management Training by Ken Thoreson\", \"imageview\": \"subg179.png\", \"splashview\": \"splash179.png\", \"isshowsplash\": \"1\", \"trainername\": \"Ken Thoreson\", \"founder\": \"Sales Management Training by Ken Thoreson\", \"subjectnameforurl\": \"ken\", \"subjectimage\": \"subg179.png\", \"subkey\": \"56828c7a-cee3-11e4-b6d3-348b1ce93e79\", \"orderno\": \"1\", \"isactive\": \"1\", \"uniquefolderid\": \"179\", \"channeltype\": \"GST\", \"cdntype\": \"1\", \"innerlogintype\": \"4\", \"leaderboardflag\": \"true\", \"communityflag\": \"false\", \"readonlymodeflag\": \"false\", \"defaultviewtype\": \"grid\", \"BottomLogoFlag\": \"false\", \"quizbasetype\": \"htmlbase\", \"rightslider\": \"true\", \"mentormenteeflag\": \"false\" } ] }, { \"id\": \"84\", \"channelid\": \"84\", \"channeltitle\": \"Elevator Pitch\", \"channelimage\": \"elevatorpitch.png\", \"version\": \"1\", \"background\": \"NA\", \"showpattern\": \"ZigZag\", \"channelurl\": \"elevator-pitch\", \"channelxml\": \"NA\", \"channelkey\": \"61368e18-2ae2-11e5-9d6c-55f2bfe645a2\", \"channelbackground\": \"NA\", \"orderno\": \"1\", \"libraryid\": \"2\", \"isactive\": \"1\", \"subjectinfo\": [ { \"id\": \"6\", \"subjectid\": \"6\", \"subjectname\": \"ProActive Selling by M3 Learning\", \"channelid\": \"84\", \"version\": \"1\", \"subjectxml\": \"windows_category.xml\", \"showpattern\": \"ZigZag\", \"ismandatory\": \"0\", \"prerequisitesid\": \"0\", \"title\": \"ProActive Selling by M3 Learning\", \"keyword\": \"ProActive Selling by M3 Learning\", \"description\": \"NA\", \"longdescription\": \"ProActive Selling by M3 Learning\", \"imageview\": \"sub333.png\", \"splashview\": \"splash333.png\", \"isshowsplash\": \"1\", \"trainername\": \"Skip Admin\", \"founder\": \"ProActive Selling by M3 Learning\", \"subjectnameforurl\": \"skip\", \"subjectimage\": \"sub1249.png\", \"subkey\": \"ac6502c2-8fef-11e4-bc07-7450382512eb\", \"orderno\": \"6\", \"isactive\": \"1\", \"uniquefolderid\": \"333\", \"channeltype\": \"GST\", \"cdntype\": \"1\", \"cdnurl\": \"https://storage.googleapis.com/cdn.wagmob.com/gst/subject/\", \"innerlogintype\": \"4\", \"leaderboardflag\": \"true\", \"communityflag\": \"false\", \"readonlymodeflag\": \"false\", \"defaultviewtype\": \"grid\", \"BottomLogoFlag\": \"false\", \"quizbasetype\": \"htmlbase\", \"rightslider\": \"true\", \"mentormenteeflag\": \"false\" }, { \"id\": \"418\", \"subjectid\": \"418\", \"subjectname\": \"30 Second Sales Pitch by Kalpit Jain\", \"channelid\": \"84\", \"version\": \"1\", \"subjectxml\": \"windows_category.xml\", \"showpattern\": \"ZigZag\", \"ismandatory\": \"0\", \"prerequisitesid\": \"0\", \"title\": \"30 Second Sales Pitch by Kalpit Jain\", \"keyword\": \"30 Second Sales Pitch by Kalpit Jain\", \"description\": \"NA\", \"longdescription\": \"30 Second Sales Pitch by Kalpit Jain\", \"imageview\": \"sub518.png\", \"splashview\": \"splash518.png\", \"isshowsplash\": \"1\", \"trainername\": \"Kavita Jain\", \"founder\": \"30 Second Sales Pitch by Kalpit Jain\", \"subjectnameforurl\": \"kalpit\", \"subjectimage\": \"sub5614.png\", \"subkey\": \"b1a8d534-09dd-11e5-8c58-8ab7f7af89a1\", \"orderno\": \"48\", \"isactive\": \"1\", \"uniquefolderid\": \"518\", \"channeltype\": \"GST\", \"cdntype\": \"1\", \"cdnurl\": \"https://storage.googleapis.com/cdn.wagmob.com/gst/subject/\", \"innerlogintype\": \"4\", \"leaderboardflag\": \"true\", \"communityflag\": \"false\", \"readonlymodeflag\": \"false\", \"defaultviewtype\": \"grid\", \"BottomLogoFlag\": \"false\", \"quizbasetype\": \"htmlbase\", \"rightslider\": \"true\", \"mentormenteeflag\": \"false\" } ] }, { \"id\": \"85\", \"channelid\": \"85\", \"channeltitle\": \"Prospecting\", \"channelimage\": \"prospecting.png\", \"version\": \"1\", \"background\": \"NA\", \"showpattern\": \"ZigZag\", \"channelxml\": \"NA\", \"channelurl\": \"prospecting\", \"channelkey\": \"6baaf96a-2ae2-11e5-9d6c-55f2bfe645a2\", \"channelbackground\": \"NA\", \"orderno\": \"1\", \"libraryid\": \"2\", \"isactive\": \"1\", \"subjectinfo\": [ { \"id\": \"6\", \"subjectid\": \"6\", \"subjectname\": \"ProActive Selling by M3 Learning\", \"channelid\": \"85\", \"version\": \"1\", \"subjectxml\": \"windows_category.xml\", \"showpattern\": \"ZigZag\", \"ismandatory\": \"0\", \"prerequisitesid\": \"0\", \"title\": \"ProActive Selling by M3 Learning\", \"keyword\": \"ProActive Selling by M3 Learning\", \"description\": \"NA\", \"longdescription\": \"ProActive Selling by M3 Learning\", \"imageview\": \"sub333.png\", \"splashview\": \"splash333.png\", \"isshowsplash\": \"1\", \"trainername\": \"Skip Admin\", \"founder\": \"ProActive Selling by M3 Learning\", \"subjectnameforurl\": \"skip\", \"subjectimage\": \"sub1249.png\", \"subkey\": \"ac6502c2-8fef-11e4-bc07-7450382512eb\", \"orderno\": \"6\", \"isactive\": \"1\", \"uniquefolderid\": \"333\", \"channeltype\": \"GST\", \"cdntype\": \"1\", \"cdnurl\": \"https://storage.googleapis.com/cdn.wagmob.com/gst/subject/\", \"innerlogintype\": \"4\", \"leaderboardflag\": \"true\", \"communityflag\": \"false\", \"readonlymodeflag\": \"false\", \"defaultviewtype\": \"grid\", \"BottomLogoFlag\": \"false\", \"quizbasetype\": \"htmlbase\", \"rightslider\": \"true\", \"mentormenteeflag\": \"false\" }, { \"id\": \"33\", \"subjectid\": \"33\", \"subjectname\": \"Proactive Prospecting with Tibor Shanto\", \"channelid\": \"85\", \"version\": \"1\", \"subjectxml\": \"windows_category.xml\", \"showpattern\": \"ZigZag\", \"ismandatory\": \"0\", \"prerequisitesid\": \"0\", \"title\": \"Proactive Prospecting with Tibor Shanto\", \"keyword\": \"Proactive Prospecting with Tibor Shanto\", \"description\": \"NA\", \"longdescription\": \"Proactive Prospecting with Tibor Shanto\", \"imageview\": \"subg133.png\", \"splashview\": \"splash133.png\", \"isshowsplash\": \"1\", \"trainername\": \"Tibor Shanto\", \"founder\": \"Proactive Prospecting with Tibor Shanto\", \"subjectnameforurl\": \"tibor\", \"subjectimage\": \"subg133.png\", \"subkey\": \"33402dd0-be44-11e4-b754-faa754af722c\", \"orderno\": \"1\", \"isactive\": \"1\", \"uniquefolderid\": \"133\", \"channeltype\": \"GST\", \"cdntype\": \"1\", \"cdnurl\": \"https://storage.googleapis.com/cdn.wagmob.com/gst/subject/\", \"innerlogintype\": \"4\", \"leaderboardflag\": \"true\", \"communityflag\": \"false\", \"readonlymodeflag\": \"false\", \"defaultviewtype\": \"grid\", \"BottomLogoFlag\": \"false\", \"quizbasetype\": \"htmlbase\", \"rightslider\": \"true\", \"mentormenteeflag\": \"false\" } ] }, { \"id\": \"86\", \"channelid\": \"86\", \"channeltitle\": \"Social Selling\", \"channelimage\": \"socialselling.png\", \"version\": \"1\", \"background\": \"NA\", \"showpattern\": \"ZigZag\", \"channelxml\": \"NA\", \"channelurl\": \"social-selling\", \"channelkey\": \"7b4cce34-2ae2-11e5-9d6c-55f2bfe645a2\", \"channelbackground\": \"NA\", \"orderno\": \"1\", \"libraryid\": \"2\", \"isactive\": \"1\", \"subjectinfo\": [ { \"id\": \"6\", \"subjectid\": \"6\", \"subjectname\": \"ProActive Selling by M3 Learning\", \"channelid\": \"86\", \"version\": \"1\", \"subjectxml\": \"windows_category.xml\", \"showpattern\": \"ZigZag\", \"ismandatory\": \"0\", \"prerequisitesid\": \"0\", \"title\": \"ProActive Selling by M3 Learning\", \"keyword\": \"ProActive Selling by M3 Learning\", \"description\": \"NA\", \"longdescription\": \"ProActive Selling by M3 Learning\", \"imageview\": \"sub333.png\", \"splashview\": \"splash333.png\", \"isshowsplash\": \"1\", \"trainername\": \"Skip Admin\", \"founder\": \"ProActive Selling by M3 Learning\", \"subjectnameforurl\": \"skip\", \"subjectimage\": \"sub1249.png\", \"subkey\": \"ac6502c2-8fef-11e4-bc07-7450382512eb\", \"orderno\": \"6\", \"isactive\": \"1\", \"uniquefolderid\": \"333\", \"channeltype\": \"GST\", \"cdntype\": \"1\", \"cdnurl\": \"https://storage.googleapis.com/cdn.wagmob.com/gst/subject/\", \"innerlogintype\": \"4\", \"leaderboardflag\": \"true\", \"communityflag\": \"false\", \"readonlymodeflag\": \"false\", \"defaultviewtype\": \"grid\", \"BottomLogoFlag\": \"false\", \"quizbasetype\": \"htmlbase\", \"rightslider\": \"true\", \"mentormenteeflag\": \"false\" }, { \"id\": \"138\", \"subjectid\": \"138\", \"subjectname\": \"LinkedIn Training by John Nemo\", \"channelid\": \"86\", \"version\": \"1\", \"subjectxml\": \"windows_category.xml\", \"showpattern\": \"ZigZag\", \"ismandatory\": \"0\", \"prerequisitesid\": \"0\", \"title\": \"LinkedIn Training by John Nemo\", \"keyword\": \"LinkedIn Training by John Nemo\", \"description\": \"NA\", \"longdescription\": \"LinkedIn Training by John Nemo\", \"imageview\": \"sub437.png\", \"splashview\": \"splash437.png\", \"isshowsplash\": \"1\", \"trainername\": \"John Nemo\", \"founder\": \"LinkedIn Training by John Nemo\", \"subjectnameforurl\": \"john\", \"subjectimage\": \"sub1043.png\", \"subkey\": \"325f3874-f2e8-11e4-ba52-8b6869d6f342\", \"orderno\": \"1\", \"isactive\": \"1\", \"uniquefolderid\": \"437\", \"channeltype\": \"GST\", \"cdntype\": \"1\", \"innerlogintype\": \"4\", \"leaderboardflag\": \"true\", \"communityflag\": \"false\", \"readonlymodeflag\": \"false\", \"defaultviewtype\": \"grid\", \"BottomLogoFlag\": \"false\", \"quizbasetype\": \"htmlbase\", \"rightslider\": \"true\", \"mentormenteeflag\": \"false\" }, { \"id\": \"376\", \"subjectid\": \"376\", \"subjectname\": \"Blogging 101: Planning a Successful Blog by DeltinaU\", \"channelid\": \"86\", \"version\": \"1\", \"subjectxml\": \"windows_category.xml\", \"showpattern\": \"ZigZag\", \"ismandatory\": \"0\", \"prerequisitesid\": \"0\", \"title\": \"Blogging 101: Planning a Successful Blog by DeltinaU\", \"keyword\": \"Blogging 101: Planning a Successful Blog by DeltinaU\", \"description\": \"NA\", \"longdescription\": \"Blogging 101: Planning a Successful Blog by DeltinaU\", \"imageview\": \"sub441.png\", \"splashview\": \"splash441.png\", \"isshowsplash\": \"1\", \"trainername\": \"DeltinaU Admin\", \"founder\": \"Blogging 101: Planning a Successful Blog by DeltinaU\", \"subjectnameforurl\": \"blogging_deltina\", \"subjectimage\": \"sub4837.png\", \"subkey\": \"c5129a70-f9fb-11e4-a33a-fd1b907fcc82\", \"orderno\": \"1\", \"isactive\": \"1\", \"uniquefolderid\": \"441\", \"channeltype\": \"GST\", \"cdntype\": \"1\", \"innerlogintype\": \"4\", \"leaderboardflag\": \"true\", \"communityflag\": \"false\", \"readonlymodeflag\": \"false\", \"defaultviewtype\": \"grid\", \"BottomLogoFlag\": \"false\", \"quizbasetype\": \"htmlbase\", \"rightslider\": \"true\", \"mentormenteeflag\": \"false\" } ] }, { \"id\": \"87\", \"channelid\": \"87\", \"channeltitle\": \"Qualifying\", \"channelimage\": \"qualifying.png\", \"version\": \"1\", \"background\": \"NA\", \"showpattern\": \"ZigZag\", \"channelxml\": \"NA\", \"channelurl\": \"qualifying\", \"channelkey\": \"88a91664-2ae2-11e5-9d6c-55f2bfe645a2\", \"channelbackground\": \"NA\", \"orderno\": \"1\", \"libraryid\": \"2\", \"isactive\": \"1\", \"subjectinfo\": [ { \"id\": \"6\", \"subjectid\": \"6\", \"subjectname\": \"ProActive Selling by M3 Learning\", \"channelid\": \"87\", \"version\": \"1\", \"subjectxml\": \"windows_category.xml\", \"showpattern\": \"ZigZag\", \"ismandatory\": \"0\", \"prerequisitesid\": \"0\", \"title\": \"ProActive Selling by M3 Learning\", \"keyword\": \"ProActive Selling by M3 Learning\", \"description\": \"NA\", \"longdescription\": \"ProActive Selling by M3 Learning\", \"imageview\": \"sub333.png\", \"splashview\": \"splash333.png\", \"isshowsplash\": \"1\", \"trainername\": \"Skip Admin\", \"founder\": \"ProActive Selling by M3 Learning\", \"subjectnameforurl\": \"skip\", \"subjectimage\": \"sub1249.png\", \"subkey\": \"ac6502c2-8fef-11e4-bc07-7450382512eb\", \"orderno\": \"6\", \"isactive\": \"1\", \"uniquefolderid\": \"333\", \"channeltype\": \"GST\", \"cdntype\": \"1\", \"cdnurl\": \"https://storage.googleapis.com/cdn.wagmob.com/gst/subject/\", \"innerlogintype\": \"4\", \"leaderboardflag\": \"true\", \"communityflag\": \"false\", \"readonlymodeflag\": \"false\", \"defaultviewtype\": \"grid\", \"BottomLogoFlag\": \"false\", \"quizbasetype\": \"htmlbase\", \"rightslider\": \"true\", \"mentormenteeflag\": \"false\" }] }, { \"id\": \"88\", \"channelid\": \"88\", \"channeltitle\": \"Presenting\", \"channelimage\": \"presenting.png\", \"version\": \"1\", \"background\": \"NA\", \"showpattern\": \"ZigZag\", \"channelxml\": \"NA\", \"channelurl\": \"presenting\", \"channelkey\": \"8ffeabea-2ae2-11e5-9d6c-55f2bfe645a2\", \"channelbackground\": \"NA\", \"orderno\": \"1\", \"libraryid\": \"2\", \"isactive\": \"1\", \"subjectinfo\": [ { \"id\": \"1\", \"subjectid\": \"1\", \"subjectname\": \"Communication Training by Richard Klees\", \"channelid\": \"88\", \"version\": \"1\", \"subjectxml\": \"windows_category.xml\", \"showpattern\": \"ZigZag\", \"ismandatory\": \"0\", \"prerequisitesid\": \"0\", \"title\": \"Communication Training by Richard Klees\", \"keyword\": \"Communication Training by Richard Klees\", \"description\": \"NA\", \"longdescription\": \"Communication Training by Richard Klees\", \"imageview\": \"sub127.png\", \"splashview\": \"splash127.png\", \"isshowsplash\": \"1\", \"trainername\": \"Richard Kless\", \"founder\": \"Communication Training by Richard Klees\", \"subjectnameforurl\": \"richard\", \"subjectimage\": \"sub1117.png\", \"subkey\": \"b4329004-40bd-11e4-b461-6f7707bea4f9\", \"orderno\": \"1\", \"isactive\": \"1\", \"uniquefolderid\": \"127\", \"channeltype\": \"GST\", \"cdntype\": \"1\", \"cdnurl\": \"https://storage.googleapis.com/cdn.wagmob.com/gst/subject/\", \"innerlogintype\": \"4\", \"leaderboardflag\": \"true\", \"communityflag\": \"false\", \"readonlymodeflag\": \"false\", \"defaultviewtype\": \"grid\", \"BottomLogoFlag\": \"false\", \"quizbasetype\": \"htmlbase\", \"rightslider\": \"true\", \"mentormenteeflag\": \"false\" }, { \"id\": \"31\", \"subjectid\": \"31\", \"subjectname\": \"Strategic Sales Presentations by Jack Malcolm\", \"channelid\": \"88\", \"version\": \"1\", \"subjectxml\": \"windows_category.xml\", \"showpattern\": \"ZigZag\", \"ismandatory\": \"0\", \"prerequisitesid\": \"0\", \"title\": \"Strategic Sales Presentations by Jack Malcolm\", \"keyword\": \"Strategic Sales Presentations by Jack Malcolm\", \"description\": \"NA\", \"longdescription\": \"Strategic Sales Presentations by Jack Malcolm\", \"imageview\": \"subg131.png\", \"splashview\": \"splash131.png\", \"isshowsplash\": \"1\", \"trainername\": \"Jack Malcolm\", \"founder\": \"Strategic Sales Presentations by Jack Malcolm\", \"subjectnameforurl\": \"jack\", \"subjectimage\": \"subg131.png\", \"subkey\": \"543254c6-b8c9-11e4-afca-74823273a9f5\", \"orderno\": \"1\", \"isactive\": \"1\", \"uniquefolderid\": \"131\", \"channeltype\": \"GST\", \"cdntype\": \"1\", \"cdnurl\": \"https://storage.googleapis.com/cdn.wagmob.com/gst/subject/\", \"innerlogintype\": \"4\", \"leaderboardflag\": \"true\", \"communityflag\": \"false\", \"readonlymodeflag\": \"false\", \"defaultviewtype\": \"grid\", \"BottomLogoFlag\": \"false\", \"quizbasetype\": \"htmlbase\", \"rightslider\": \"true\", \"mentormenteeflag\": \"false\" }, { \"id\": \"132\", \"subjectid\": \"132\", \"subjectname\": \"Project Management for Sales Professionals\", \"channelid\": \"88\", \"version\": \"1\", \"subjectxml\": \"windows_category.xml\", \"showpattern\": \"ZigZag\", \"ismandatory\": \"0\", \"prerequisitesid\": \"0\", \"title\": \"Project Management for Sales Professionals\", \"keyword\": \"Project Management for Sales Professionals\", \"description\": \"NA\", \"longdescription\": \"Project Management for Sales Professionals\", \"imageview\": \"sub431.png\", \"splashview\": \"splash431.png\", \"isshowsplash\": \"1\", \"trainername\": \"Mike G\", \"founder\": \"Project Management for Sales Professionals\", \"subjectnameforurl\": \"mikegoss-management\", \"subjectimage\": \"sub864.png\", \"subkey\": \"8f8e6a6e-e588-11e4-b8e2-2ba7c4e018d5\", \"orderno\": \"1\", \"isactive\": \"1\", \"uniquefolderid\": \"431\", \"channeltype\": \"GST\", \"cdntype\": \"1\", \"innerlogintype\": \"4\", \"leaderboardflag\": \"true\", \"communityflag\": \"false\", \"readonlymodeflag\": \"false\", \"defaultviewtype\": \"grid\", \"BottomLogoFlag\": \"false\", \"quizbasetype\": \"htmlbase\", \"rightslider\": \"true\", \"mentormenteeflag\": \"false\" }, { \"id\": \"133\", \"subjectid\": \"133\", \"subjectname\": \"Storytelling for Sales Professionals by Mike Goss\", \"channelid\": \"88\", \"version\": \"1\", \"subjectxml\": \"windows_category.xml\", \"showpattern\": \"ZigZag\", \"ismandatory\": \"0\", \"prerequisitesid\": \"0\", \"title\": \"Storytelling for Sales Professionals by Mike Goss\", \"keyword\": \"Storytelling for Sales Professionals by Mike Goss\", \"description\": \"NA\", \"longdescription\": \"Storytelling for Sales Professionals by Mike Goss\", \"imageview\": \"subg431.png\", \"splashview\": \"splash432.png\", \"isshowsplash\": \"1\", \"trainername\": \"Mike G\", \"founder\": \"Storytelling for Sales Professionals by Mike Goss\", \"subjectnameforurl\": \"mikegoss-storytelling\", \"subjectimage\": \"subg431.png\", \"subkey\": \"9cfa87cc-e589-11e4-b8e2-2ba7c4e018d5\", \"orderno\": \"1\", \"isactive\": \"1\", \"uniquefolderid\": \"432\", \"channeltype\": \"GST\", \"cdntype\": \"1\", \"cdnurl\": \"https://storage.googleapis.com/cdn.wagmob.com/gst/subject/\", \"innerlogintype\": \"4\", \"leaderboardflag\": \"true\", \"communityflag\": \"false\", \"readonlymodeflag\": \"false\", \"defaultviewtype\": \"grid\", \"BottomLogoFlag\": \"false\", \"quizbasetype\": \"htmlbase\", \"rightslider\": \"true\", \"mentormenteeflag\": \"false\" } ] }, { \"id\": \"90\", \"channelid\": \"90\", \"channeltitle\": \"Closing\", \"channelimage\": \"closing.png\", \"version\": \"1\", \"background\": \"NA\", \"showpattern\": \"ZigZag\", \"channelxml\": \"NA\", \"channelurl\": \"closing\", \"channelkey\": \"b231f492-2ae2-11e5-9d6c-55f2bfe645a2\", \"channelbackground\": \"NA\", \"orderno\": \"1\", \"libraryid\": \"2\", \"isactive\": \"1\", \"subjectinfo\": [ { \"id\": \"1\", \"subjectid\": \"1\", \"subjectname\": \"Communication Training by Richard Klees\", \"channelid\": \"90\", \"version\": \"1\", \"subjectxml\": \"windows_category.xml\", \"showpattern\": \"ZigZag\", \"ismandatory\": \"0\", \"prerequisitesid\": \"0\", \"title\": \"Communication Training by Richard Klees\", \"keyword\": \"Communication Training by Richard Klees\", \"description\": \"NA\", \"longdescription\": \"Communication Training by Richard Klees\", \"imageview\": \"sub127.png\", \"splashview\": \"splash127.png\", \"isshowsplash\": \"1\", \"trainername\": \"Richard Kless\", \"founder\": \"Communication Training by Richard Klees\", \"subjectnameforurl\": \"richard\", \"subjectimage\": \"sub1117.png\", \"subkey\": \"b4329004-40bd-11e4-b461-6f7707bea4f9\", \"orderno\": \"1\", \"isactive\": \"1\", \"uniquefolderid\": \"127\", \"channeltype\": \"GST\", \"cdntype\": \"1\", \"cdnurl\": \"https://storage.googleapis.com/cdn.wagmob.com/gst/subject/\", \"innerlogintype\": \"4\", \"leaderboardflag\": \"true\", \"communityflag\": \"false\", \"readonlymodeflag\": \"false\", \"defaultviewtype\": \"grid\", \"BottomLogoFlag\": \"false\", \"quizbasetype\": \"htmlbase\", \"rightslider\": \"true\", \"mentormenteeflag\": \"false\" }, { \"id\": \"32\", \"subjectid\": \"32\", \"subjectname\": \"The Fundamentals of a Successful Sales Career by Tom Hopkins\", \"channelid\": \"90\", \"version\": \"1\", \"subjectxml\": \"windows_category.xml\", \"showpattern\": \"ZigZag\", \"ismandatory\": \"0\", \"prerequisitesid\": \"0\", \"title\": \"The Fundamentals of a Successful Sales Career by Tom Hopkins\", \"keyword\": \"The Fundamentals of a Successful Sales Career by Tom Hopkins\", \"description\": \"NA\", \"longdescription\": \"The Fundamentals of a Successful Sales Career by Tom Hopkins\", \"imageview\": \"subg132.png\", \"splashview\": \"splash132.png\", \"isshowsplash\": \"1\", \"trainername\": \"Tom Hopkins\", \"founder\": \"The Fundamentals of a Successful Sales Career by Tom Hopkins\", \"subjectnameforurl\": \"tom\", \"subjectimage\": \"subg132.png\", \"subkey\": \"b5e1791a-b764-11e4-8f4e-8a3b88f84675\", \"orderno\": \"1\", \"isactive\": \"1\", \"uniquefolderid\": \"132\", \"channeltype\": \"GST\", \"cdntype\": \"1\", \"cdnurl\": \"https://storage.googleapis.com/cdn.wagmob.com/gst/subject/\", \"innerlogintype\": \"4\", \"leaderboardflag\": \"true\", \"communityflag\": \"false\", \"readonlymodeflag\": \"false\", \"defaultviewtype\": \"grid\", \"BottomLogoFlag\": \"false\", \"quizbasetype\": \"htmlbase\", \"rightslider\": \"true\", \"mentormenteeflag\": \"false\" } ] }, { \"id\": \"91\", \"channelid\": \"91\", \"channeltitle\": \"Tools\", \"channelimage\": \"tools2.png\", \"version\": \"1\", \"background\": \"NA\", \"showpattern\": \"ZigZag\", \"channelxml\": \"NA\", \"channelurl\": \"tools\", \"channelkey\": \"bbac7754-2ae2-11e5-9d6c-55f2bfe645a2\", \"channelbackground\": \"NA\", \"orderno\": \"1\", \"libraryid\": \"2\", \"isactive\": \"1\", \"subjectinfo\": [{ \"id\": \"33\", \"subjectid\": \"33\", \"subjectname\": \"Proactive Prospecting with Tibor Shanto\", \"channelid\": \"91\", \"version\": \"1\", \"subjectxml\": \"windows_category.xml\", \"showpattern\": \"ZigZag\", \"ismandatory\": \"0\", \"prerequisitesid\": \"0\", \"title\": \"Proactive Prospecting with Tibor Shanto\", \"keyword\": \"Proactive Prospecting with Tibor Shanto\", \"description\": \"NA\", \"longdescription\": \"Proactive Prospecting with Tibor Shanto\", \"imageview\": \"subg133.png\", \"splashview\": \"splash133.png\", \"isshowsplash\": \"1\", \"trainername\": \"Tibor Shanto\", \"founder\": \"Proactive Prospecting with Tibor Shanto\", \"subjectnameforurl\": \"tibor\", \"subjectimage\": \"subg133.png\", \"subkey\": \"33402dd0-be44-11e4-b754-faa754af722c\", \"orderno\": \"1\", \"isactive\": \"1\", \"uniquefolderid\": \"133\", \"channeltype\": \"GST\", \"cdntype\": \"1\", \"cdnurl\": \"https://storage.googleapis.com/cdn.wagmob.com/gst/subject/\", \"innerlogintype\": \"4\", \"leaderboardflag\": \"true\", \"communityflag\": \"false\", \"readonlymodeflag\": \"false\", \"defaultviewtype\": \"grid\", \"BottomLogoFlag\": \"false\", \"quizbasetype\": \"htmlbase\", \"rightslider\": \"true\", \"mentormenteeflag\": \"false\" }] } ] } } }'; 
           dto = (OrgInfoDto)System.JSON.deserialize(jsonCDN, OrgInfoDto.class);
          Map<String,String> parameter = new Map<String,String>();
          parameter.put('email', 'test54@test.com');
          parameter.put('password', '12345');
          parameter.put('login_provider', 'wagmob');
          parameter.put('captcha', 'na');
          parameter.put('captcha_id', 'na');
          parameter.put('platform_name', 'web');
          jsondata = new CallingWebServices().getRestfulWSResponse(parameter, 'POST', 'https://prodws.wagmob.com/api/v6/login', 'NA');
          oauthtoken = new CallingWebServices().getJsonResponse(jsondata,'oauthtoken');  
          loginId = new CallingWebServices().getJsonResponse(jsondata,'loginId'); 
          //String url = 'https://salusuapiprod-stage.azurewebsites.net/client/v1/user/signin';
         // Map<String,String> parameter2 = new Map<String,String>();
         // parameter2.put('email_id','test87@test.com');
        //  parameter2.put('password', '123456');
         // parameter2.put('keep_login', '1');
        // jsondata = new CallingWebServices().getRestfulWSResponse(parameter2, 'POST', url, 'NA');
     }
    public Boolean getQuizResult(){
        return quizResult;
    }
   public Boolean getFirstFrame() {
        return firstframe;
    }
    public String getVideoStatus(){
        return videoStatus;
    }
    public Integer getCountTask(){
        return countTask;
    }
    public Integer getCountCompleteTask(){
        return countCompleteTask;
    }
    public Boolean getSubmilestoneStatus(){
        return submilestonestatus;
    }
    public Integer getCountMandatory(){
        return countmandatory;
    }
    
public PageReference getQuizFileByFloderId() {
        quizResult=false;
        countmandatory = countMandatoryTask();
        firstFrame = true;
        correctAnswerCount=0;
        index = -1;
        count =1;
        quizXml = new CallingWebServices().getQuizFile(folderId, quizFilName);
        quizlist = parseQuiz(quizXml);
        Quiz quiz = quizlist.get(0);
        questionfilecombo = quiz.getQuestionFileCombo();
        String percent = new CallingWebServices().getJsonResponse(getProgress,'percent');
        
         if(ismandatory == 'false'){
             if(percent!=null){
                countmandatory = Integer.valueOf(percent); 
             }else{
               countmandatory = 0;  
             }   
          Map<String,String> parameter = new Map<String,String>();
          parameter.put('platform', 'web');
          parameter.put('percent', string.valueof(countmandatory));
          parameter.put('progress_json', '{"progress":[{"task_id":"'+taskId+'","status":1,"spent_time":0,"total_question_count":'+count+',"correct_question_count":'+correctAnswerCount+'}]}');
          parameter.put('subkey', subkey);
          parameter.put('captcha_id', 'na');
          parameter.put('platform_name', 'web');
          setProgress = new CallingWebServices().getRestfulWSResponse(parameter, 'POST', 'https://prodws.wagmob.com/api/v6/set/progress', oauthtoken);
            } 
         return null;
    }
    
    
public PageReference incrementCounter() {
       quizCount = quizlist.size();
        if (count < quizCount){
        Quiz quiz =  quizlist.get(count);
       correctoption = quiz.getCorrectOption();
       correctoption = correctoption.toLowerCase();
       questionid = quiz.getQuestionId();
       questionfilecombo = quiz.getQuestionFileCombo(); 
       count++;  
        }
        index++;
        if(index != -1 && index < quizlist.size()){
       Quiz quiz =  quizlist.get(index);
       correctoption = quiz.getCorrectOption();
       correctoption = correctoption.toLowerCase();     
       questionid = quiz.getQuestionId();
            if(correctoption.equals(data)){
                currectanswer = 0;
                correctAnswerCount++;
            }else{
              currectanswer = 1;
            }
        }
        quizCount = quizCount-1;
             getProgress =new CallingWebServices().getRestfulWSResponse(null, 'GET', 'https://prodws.wagmob.com/api/v6/progress/'+subkey,oauthtoken);
             String percent = new CallingWebServices().getJsonResponse(getProgress,'percent');
           Integer progress =  100/countmandatory;
           if(percent != null){
           progress = progress + Integer.valueOf(percent); 
        }   
        if(quizCount == index ){
            quizResult=true;
            firstframe=false;
            Double x =correctAnswerCount;
            Double y = count;
            Double percentage = (x/y) * 100;
            quizPercentage =percentage.intValue();
             failResult=true;
             passResult=false;
         if(quizPercentage>= 80 && getProgress.contains(taskId) == false){
             failResult=false;
             passResult=true;
          Map<String,String> parameter = new Map<String,String>();
          parameter.put('platform', 'web');
          parameter.put('percent', string.valueof(progress));
          parameter.put('progress_json', '{"progress":[{"task_id":"'+taskId+'","status":1,"spent_time":0,"total_question_count":'+count+',"correct_question_count":'+correctAnswerCount+'}]}');
          parameter.put('subkey', subkey);
          parameter.put('captcha_id', 'na');
          parameter.put('platform_name', 'web');
         setProgress = new CallingWebServices().getRestfulWSResponse(parameter, 'POST', 'https://prodws.wagmob.com/api/v6/set/progress', oauthtoken);
            }
          
        }
        
      return null;
    }  
    public Integer getCorrectAnswerCount() {
        return correctAnswerCount;
    }
    public Integer getCount() {
        return count;
    }
    public Integer getIndex(){
        return index;
    }

    public Integer getCurrectAnswer(){
        return currectanswer;
    }
    public Integer getMilestoneSize(){
        return milestoneSize;
    }
    public Integer getSubmilestoneSize(){
        return submilestoneSize;
    }
    
    public PageReference checkAnswer(){
        index++;
        return null;
    }
    public PageReference getSubjectByChannel(){
        return null;
    }
    public PageReference getMileStoneByFolderId(){
    milestonestatus = '';
    getProgress =new CallingWebServices().getRestfulWSResponse(null, 'GET', 'https://prodws.wagmob.com/api/v6/progress/'+subkey,oauthtoken);   
    mileStoneXML = new CallingWebServices().getMileStone(folderId);
    milestonelist = parse(mileStoneXML);
    checkAllTaskComplete();
    countcompletesubmilestone=0;
    totalsubmilestone=0;    
    for(Item item : milestonelist) { 
       for(SubItem subitem :item.subitem){
           totalsubmilestone++;
           if(status.contains(subitem.containerid)){
               countcompletesubmilestone++;
           }
       }
        if(totalsubmilestone == countcompletesubmilestone){
            milestonestatus += item.containerid;
        }  
    }
    if(totalsubmilestone == countcompletesubmilestone){
            
    }
     return null;
    }

 public PageReference  getSubMilestoneByParentId(){
        getProgress =new CallingWebServices().getRestfulWSResponse(null, 'GET', 'https://prodws.wagmob.com/api/v6/progress/'+subkey,oauthtoken);
         mileStoneXML = new CallingWebServices().getMileStone(folderId);
         milestonelist = parse(mileStoneXML);
        checkAllTaskComplete(); 
        return null;
    }
     public PageReference getTaskByContainerId(){  
         quizResult=false;
      getProgress =new CallingWebServices().getRestfulWSResponse(null, 'GET', 'https://prodws.wagmob.com/api/v6/progress/'+subkey,oauthtoken);
      return null;  
    }
    private void checkAllTaskComplete(){
        status ='';
        String status_task_id = '';
        boolean video_status = false;
        boolean tutorial_status = false;
        boolean workbook_status = false;
        boolean quiz_status = false;
      for(Item item : milestonelist) {   
       //if(item.containerid == parentid){
            for(SubItem subitem :item.subitem){
                    if(subitem.video != null){
                   for(Video video :subitem.video){
                        if(getProgress.contains(video.taskid)){
                            status_task_id = video.containerid;
                            video_status = true;
                        }else{
                           video_status = false;
                         } 
                   }  
                    }else{
                        video_status = true;
                    }
                if(subitem.tutorial != null){
                   for(Tutorial tutorial :subitem.tutorial){
                        if(getProgress.contains(tutorial.taskid)){
                            status_task_id = tutorial.containerid;
                            tutorial_status = true;
                        }else{
                          tutorial_status = false;
                           } 
                    }  
                  }else{
                       tutorial_status = true;
                  }
                  if(subitem.workbook != null){
                   Workbook workbook =subitem.workbook;
                        if(getProgress.contains(workbook.taskid)){
                             status_task_id = workbook.containerid;
                            workbook_status = true;
                        }else{
                       workbook_status = false;
                        }  
                  }else{
                       workbook_status = true;
                  }
                  if(subitem.quiz != null){
                  Quiz quiz = subitem.quiz;
                        if(getProgress.contains(quiz.taskid)){
                            status_task_id = quiz.containerid;
                            quiz_status = true;
                        }else{
                        quiz_status = false; 
                      }   
                  }else{
                     quiz_status = true; 
                  }
                if(tutorial_status && workbook_status && quiz_status && video_status){
                    status += status_task_id;
                      }
                    }
                // }
          
              } 
            }


   //video function    
    public PageReference getVideoByTaskId(){
             
      return null;  
    }
    
    //video complete function
    public PageReference checkVideoComplete(){
        countmandatory = countMandatoryTask();
             getProgress =new CallingWebServices().getRestfulWSResponse(null, 'GET', 'https://prodws.wagmob.com/api/v6/progress/'+subkey,oauthtoken);
             getTaskId = new CallingWebServices().getJsonResponseList(getProgress,'task_id');
             String percent = new CallingWebServices().getJsonResponse(getProgress,'percent');
            Integer progress =  100/countmandatory;
            if(percent != null){
            progress = progress + Integer.valueOf(percent);
            if(ismandatory == 'false'){
             progress =Integer.valueOf(percent);    
             } 
            }           
        if(getProgress.contains(taskId) == false){
          Map<String,String> parameter = new Map<String,String>();
          parameter.put('platform', 'web');
          parameter.put('percent', string.valueof(progress));
          parameter.put('progress_json', '{"progress":[{"task_id":"'+taskId+'","status":1,"spent_time":0,"total_question_count":0,"correct_question_count":0}]}');
          parameter.put('subkey', subkey);
          parameter.put('captcha_id', 'na');
          parameter.put('platform_name', 'web');    
         setProgress = new CallingWebServices().getRestfulWSResponse(parameter, 'POST', 'https://prodws.wagmob.com/api/v6/set/progress', oauthtoken);
        }
        return null;
    }
    
    public PageReference getTutorialByTaskId(){
            countmandatory =  countMandatoryTask();
             getProgress =new CallingWebServices().getRestfulWSResponse(null, 'GET', 'https://prodws.wagmob.com/api/v6/progress/'+subkey,oauthtoken);
             getTaskId = new CallingWebServices().getJsonResponseList(getProgress,'task_id');
             String percent = new CallingWebServices().getJsonResponse(getProgress,'percent');
             Integer progress =  100/countmandatory;  
             if(percent != null){
             progress = progress + Integer.valueOf(percent); 
            if(ismandatory == 'false'){
             progress =Integer.valueOf(percent);    
            } 
        }   
        if(getProgress.contains(taskId) == false){
          Map<String,String> parameter = new Map<String,String>();
          parameter.put('platform', 'web');
          parameter.put('percent',string.valueof(progress));
          parameter.put('progress_json', '{"progress":[{"task_id":"'+taskId+'","status":1,"spent_time":0,"total_question_count":0,"correct_question_count":0}]}');
          parameter.put('subkey', subkey);
          parameter.put('captcha_id', 'na');
          parameter.put('platform_name', 'web');
         setProgress = new CallingWebServices().getRestfulWSResponse(parameter, 'POST', 'https://prodws.wagmob.com/api/v6/set/progress', oauthtoken);
          }
          
      return null;  
    }
    
    public PageReference getWorkbookByTaskId(){
           countmandatory = countMandatoryTask();
             getProgress =new CallingWebServices().getRestfulWSResponse(null, 'GET', 'https://prodws.wagmob.com/api/v6/progress/'+subkey,oauthtoken);
             getTaskId = new CallingWebServices().getJsonResponseList(getProgress,'task_id');
             String percent = new CallingWebServices().getJsonResponse(getProgress,'percent');
             Integer progress =  100/countmandatory;    
             if(percent != null){
           progress = progress + Integer.valueOf(percent); 
             if(ismandatory == 'false'){
             progress =Integer.valueOf(percent);    
            } 
        }   
        if(getProgress.contains(taskId) == false){
          Map<String,String> parameter = new Map<String,String>();
          parameter.put('platform', 'web');
          parameter.put('percent',string.valueof(progress));
          parameter.put('progress_json', '{"progress":[{"task_id":"'+taskId+'","status":1,"spent_time":0,"total_question_count":0,"correct_question_count":0}]}');
          parameter.put('subkey', subkey);
          parameter.put('captcha_id', 'na');
          parameter.put('platform_name', 'web');
         setProgress = new CallingWebServices().getRestfulWSResponse(parameter, 'POST', 'https://prodws.wagmob.com/api/v6/set/progress', oauthtoken);
          }
      return null;  
    }
    
    
   
    public List<Quiz> parseQuiz(string toParse) {
        List<Quiz> quiz = new List<Quiz>();
        DOM.Document doc = new DOM.Document();
        doc.load(toParse);    
        parseQuizItems(doc.getRootElement(), quiz);
        return quiz;
    }
    
 public void parseQuizItems(DOM.XMLNode node, List<Quiz> items){
        for (Dom.XMLNode child : node.getChildElements()) {
              if (child.getName() == 'question') {
                Quiz itm = new Quiz();
                parseQuizItem(child, itm);
                items.add(itm);
            }
         }
    }

 public void parseQuizItem(DOM.XMLNode node,Quiz item){
         for (Dom.XMLNode child : node.getChildElements()) {
            if (child.getName() == 'questionid') {
                item.questionid = child.getText().trim();
            }else if (child.getName() == 'questionfilecombo') {
                item.questionfilecombo = child.getText().trim();
            } else if (child.getName() == 'correctoption') {
                item.correctoption = child.getText().trim();
            }
        }
    }
        public List<Item> parse(string toParse) {
        List<Item> items = new List<Item>();
        DOM.Document doc = new DOM.Document();
        doc.load(toParse);    
        parseItems(doc.getRootElement(), items);
        return items;
    }
      public void parseItems(DOM.XMLNode node, List<Item> items){
         for (Dom.XMLNode child : node.getChildElements()) {
              if (child.getName() == 'item') {
                Item itm = new Item();
                parseItem(child, itm);
                items.add(itm);
            }
         }
    }
    
     public void parseItem(DOM.XMLNode node, Item itm){
         List<SubItem> submile = new  List<SubItem>();
         for (Dom.XMLNode child : node.getChildElements()) {
            if (child.getName() == 'id') {
                itm.id = child.getText().trim();
            } else if (child.getName() == 'containerid') {
                itm.containerid = child.getText().trim();
            } else if (child.getName() == 'view') {
                itm.view = child.getText().trim();
            } else if (child.getName() == 'title') {
                itm.title = child.getText().trim();
            }else if (child.getName() == 'subitem') {
                SubItem subitm = new SubItem();
                getSubMilestone(child,subitm);
                submile.add(subitm);
                itm.subitem = submile;
            }
        }
    }
    public void  getSubMilestone(DOM.XMLNode node,SubItem subitm){
          List<Video> videoList = new  List<Video>();
          List<Tutorial> tutorialList = new  List<Tutorial>();
        for (Dom.XMLNode child : node.getChildElements()) {
            if (child.getName() == 'subid') {
                subitm.subid = child.getText().trim();
            }else if (child.getName() == 'parentid') {
                subitm.parentid = child.getText().trim();
            }
            else if (child.getName() == 'containerid') {
                subitm.containerid = child.getText().trim();
            }
            else if (child.getName() == 'subimageview') {
                subitm.subimageview = child.getText().trim();
            }
            else if (child.getName() == 'subtitle') {
                subitm.subtitle = child.getText().trim();
            }
            else if (child.getName() == 'video') {
                Video vdo = new Video();
                getVideo(child,vdo);
                videoList.add(vdo);
                subitm.video=videoList;
                   
            }
            else if (child.getName() == 'tutorial') {
                Tutorial tuto = new Tutorial();
                 getTutorial(child,tuto);
                tutorialList.add(tuto);
                subitm.tutorial = tutorialList; 
                   
            }else if (child.getName() == 'quiz') {
                 Quiz quiz = new Quiz();
                 getQuiz(child,quiz);
                 subitm.quiz = quiz;
                   
            }else if (child.getName() == 'workbook') {
                 Workbook work = new Workbook();
                 getWorkbook(child,work);
                 subitm.workbook = work;
                   
            }
        }
    }
    public void getWorkbook(DOM.XMLNode node,Workbook quiz){
     for(Dom.XMLNode child : node.getChildElements()) {
         if (child.getName() == 'taskid') {
                quiz.taskid = child.getText().trim();
            }
            else if (child.getName() == 'tutorialid') {
                quiz.tutorialid = child.getText().trim();
            }else if (child.getName() == 'workbookfilename') {
                quiz.workbookfilename = child.getText().trim();
            }else if (child.getName() == 'containerid') {
                quiz.containerid = child.getText().trim();
            }else if (child.getName() == 'taskimage') {
                quiz.taskimage = child.getText().trim();
            }else if (child.getName() == 'elementtitle') {
                quiz.elementtitle = child.getText().trim();
            }else if (child.getName() == 'ismandatory') {
                quiz.ismandatory = child.getText().trim();
            }
        }
    }
    public void getQuiz(DOM.XMLNode node,Quiz quiz){
     for(Dom.XMLNode child : node.getChildElements()) {
         if (child.getName() == 'taskid') {
                quiz.taskid = child.getText().trim();
            }
            else if (child.getName() == 'quizview') {
                quiz.quizview = child.getText().trim();
            }else if (child.getName() == 'quizcount') {
                quiz.quizcount = child.getText().trim();
            }else if (child.getName() == 'containerid') {
                quiz.containerid = child.getText().trim();
            }else if (child.getName() == 'quiztitle') {
                quiz.quiztitle = child.getText().trim();
            }else if (child.getName() == 'elementtitle') {
                quiz.elementtitle = child.getText().trim();
            }else if (child.getName() == 'ismandatory') {
                quiz.ismandatory = child.getText().trim();
            }
        }
    }
   public void getVideo(DOM.XMLNode node,Video vdo){
        for (Dom.XMLNode child : node.getChildElements()) {
             if (child.getName() == 'containerid') {
                vdo.containerid = child.getText().trim();
            }
            else if (child.getName() == 'videotypeid') {
                vdo.videotypeid = child.getText().trim();
            }
            else if (child.getName() == 'elementtitle') {
                vdo.elementtitle = child.getText().trim();
            }else if (child.getName() == 'taskid') {
                vdo.taskid = child.getText().trim();
            }
            else if (child.getName() == 'videotype') {
                vdo.videotype = child.getText().trim();
            }
            else if (child.getName() == 'videoid') {
                vdo.videoid = child.getText().trim();
            }
            else if (child.getName() == 'hdvideo') {
                String url = child.getText().trim().replace('http://','https://');
                List<String>  splitUrl = url.split('s=');                    
                vdo.hdvideo = splitUrl.get(0)+'autoplay=1&autopause=1&api=1&player_id=video_tag&title=0;origin=*';
            }
            else if (child.getName() == 'sdvideo') {
                String url = child.getText().trim().replace('http://','https://');
                 List<String>  splitUrl = url.split('s=');
                vdo.sdvideo  = splitUrl.get(0)+'autoplay=1&autopause=1&api=1&player_id=video_tag&title=0;origin=*';
            }
            else if (child.getName() == 'videoid') {
                vdo.videoid  = child.getText().trim();
            }
            else if (child.getName() == 'taskimage') {
                vdo.taskimage = child.getText().trim();
            }
            else if (child.getName() == 'ismandatory') {
                vdo.ismandatory = child.getText().trim();
            }
        }
    }
    
    public void getTutorial(DOM.XMLNode node,Tutorial tuto){
        for (Dom.XMLNode child : node.getChildElements()) {
            if (child.getName() == 'tutorialid') {
                tuto.tutorialid = child.getText().trim();
            }else if (child.getName() == 'taskid') {
                tuto.taskid = child.getText().trim();
            }
            else if (child.getName() == 'tutorialfilename') {
                tuto.tutorialfilename = child.getText().trim();
            }
            else if (child.getName() == 'containerid') {
                tuto.containerid = child.getText().trim();
            }
            else if (child.getName() == 'tutorialtitle') {
                tuto.tutorialtitle = child.getText().trim();
            }
            else if (child.getName() == 'elementtitle') {
                tuto.elementtitle = child.getText().trim();
            }
            else if (child.getName() == 'taskimage') {
                tuto.taskimage = child.getText().trim();
            }else if (child.getName() == 'tutorialview') {
                   String tutorial = child.getText().trim();
                if(!tutorial.contains('.html')){
                tuto.tutorialview =tutorial+'.html';    
                }else{
                tuto.tutorialview =tutorial;  
                }
            }else if (child.getName() == 'ismandatory') {
                tuto.ismandatory = child.getText().trim();
            }
        }
    }
    
  private Integer countMandatoryTask() {
       countmandatory= 0;
        for(Item item : milestonelist){
            for(SubItem subitem :item.subitem){
                if(subitem.video != null){
                  for(Video video :subitem.video){
                    if(video.ismandatory == 'true'){
                       countmandatory++; 
                    }
                }  
                }  
               if(subitem.tutorial != null){
                  for(Tutorial tutorial :subitem.tutorial){
                    if(tutorial.ismandatory == 'true'){
                       countmandatory++; 
                    }
                }  
                }
                if(subitem.quiz != null){
                    Quiz quiz = subitem.quiz;
                    if(quiz.ismandatory == 'true'){
                       countmandatory++; 
                }   
                }
               if(subitem.workbook != null){
                    Workbook workbook = subitem.workbook;
                    if(workbook.ismandatory == 'true'){
                       countmandatory++; 
                }    
            } 
        }
    }
      return countmandatory;
}

    
}
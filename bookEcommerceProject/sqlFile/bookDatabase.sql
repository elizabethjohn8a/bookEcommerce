-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: bookecommerce
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `imageurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int NOT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8el3ddb59ciucupyc17vu7835` (`category_id`),
  CONSTRAINT `FK8el3ddb59ciucupyc17vu7835` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'<h2>Mô Tả Sản Phẩm</h2><p>Doraemon là nhân vật chính hư cấu trong loạt Manga cùng tên của họa sĩ Fujiko F. Fujio. Trong truyện lấy bối cảnh ở thế kỷ 22, Doraemon là chú mèo robot của tương lai do xưởng Matsushiba — công xưởng chuyên sản xuất robot vốn dĩ nhằm mục đích chăm sóc trẻ nhỏ.</p>','https://upload.wikimedia.org/wikipedia/vi/b/b7/Doraemon1.jpg','Đôrêmon dài tập',190000,2),(2,'<h2>Thông Tin Chi Tiết</h2><figure class=\"table\"><table><tbody><tr><td>Công ty phát hành</td><td>Nhã Nam</td></tr><tr><td>Ngày xuất bản</td><td>2019-07-01 00:00:00</td></tr><tr><td>Kích thước</td><td>19.5 x 23 cm</td></tr><tr><td>Loại bìa</td><td>Bìa mềm</td></tr><tr><td>Số trang</td><td>220</td></tr><tr><td>Nhà xuất bản</td><td>Nhà Xuất Bản Thế Giới</td></tr></tbody></table></figure><h2>Mô Tả Sản Phẩm</h2><p>Truyền thông ngập tràn những khám phá và những lời khuyên mới mẻ về những thứ chúng ta nạp vào cơ thể nhưng có cơ sở khoa học nào cho bất kỳ tuyên bố đó không?<br>Với những hình minh họa rõ ràng, dễ hiểu, cuốn sách Hiểu hết về thức ăn sẽ mang lại những thông tin lý thú liên quan đến thức ăn, từ công đoạn sản xuất đến ích lợi/tác hại của chúng với sức khỏe.</p><p>Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....</p>','https://i.ibb.co/t4TB505/7827a39c17b68337b093de7850fc3337-jpg.webp','How The Body Works - Hiểu Hết Về Cơ Thể ',256500,1),(3,'<h2>Mô Tả Sản Phẩm</h2><p>Nhiều thế hệ độc giả đã say mê những sáng tác cổ tích tuyện vời của Hans Christian Andersen. Những câu chuyện cổ gợi mở trí tưởng tượng, sự hiểu biết của các em nhỏ về thế giới xung quanh. Hơn thế nữa, truyện cổ tích Andersen giáo dục các bạn nhỏ lòng yêu thương, biết ơn và kính trọng đối với ông bà, cha mẹ… Ngay cả người lớn, khi đọc cũng cảm nhận được những điều thú vị và bổ ích qua các câu chuyện đáng yêu.</p>','https://product.hstatic.net/1000328521/product/nang_tien_ca_-_3d_0b8744300c28405489f6abb8b957eca2_large.jpg','Nàng tiên cá và những câu chuyện khác',400000,5),(4,'<h2>Mô Tả Sản Phẩm</h2><p>Thám tử lừng danh Conan là một series manga trinh thám được sáng tác bởi Aoyama Gōshō. Tác phẩm được đăng tải trên tạp chí Weekly Shōnen Sunday của nhà xuất bản Shogakukan vào năm 1994 và được đóng gói thành 102 tập tankōbon tính đến tháng 9 năm 2022.</p>','https://upload.wikimedia.org/wikipedia/vi/thumb/3/3e/Detective_conan_cover_1.jpg/220px-Detective_conan_cover_1.jpg','Thám tử lừng danh Conan - dài tập',230000,2),(5,'<h2>Thông Tin Chi Tiết</h2><figure class=\"table\"><table><tbody><tr><td>Công ty phát hành</td><td>Saigon Books</td></tr><tr><td>Ngày xuất bản</td><td>2022-06-01 00:00:00</td></tr><tr><td>Loại bìa</td><td>Bìa mềm</td></tr><tr><td>Số trang</td><td>224</td></tr><tr><td>Nhà xuất bản</td><td>Nhà Xuất Bản Thế Giới</td></tr></tbody></table></figure><h2>Mô Tả Sản Phẩm</h2><p>Nhiều người trong chúng ta tin rằng cuộc đời của ta bắt đầu từ lúc chào đời và kết thúc khi ta chết. Chúng ta tin rằng chúng ta tới từ cái Không, nên khi chết chúng ta cũng không còn lại gì hết. Và chúng ta lo lắng vì sẽ trở thành hư vô.<br><br>Bụt có cái hiểu rất khác về cuộc đời. Ngài hiểu rằng sống và chết chỉ là những ý niệm không có thực. Coi đó là sự thực, chính là nguyên do gây cho chúng ta khổ não. Bụt dạy không có sinh, không có diệt, không tới cũng không đi, không giống nhau cũng không khác nhau, không có cái ngã thường hằng cũng không có hư vô. Chúng ta thì coi là Có hết mọi thứ. Khi chúng ta hiểu rằng mình không bị hủy diệt thì chúng ta không còn lo sợ. Đó là sự giải thoát. Chúng ta có thể an hưởng và thưởng thức đời sống một cách mới mẻ.<br><br>Không diệt Không sinh Đừng sợ hãi là tựa sách được Thiền sư Thích Nhất Hạnh viết nên dựa trên kinh nghiệm của chính mình. Ở đó, Thầy Nhất Hạnh đã đưa ra một thay thế đáng ngạc nhiên cho hai triết lý trái ngược nhau về vĩnh cửu và hư không: “Tự muôn đời tôi vẫn tự do. Tử sinh chỉ là cửa ngõ ra vào, tử sinh là trò chơi cút bắt. Tôi chưa bao giờ từng sinh cũng chưa bao giờ từng diệt” và “Nỗi khổ lớn nhất của chúng ta là ý niệm về đến-đi, lui-tới.”<br><br>Được lặp đi lặp lại nhiều lần, Thầy khuyên chúng ta thực tập nhìn sâu để chúng ta hiểu được và tự mình nếm được sự tự do của con đường chính giữa, không bị kẹt vào cả hai ý niệm của vĩnh cửu và hư không. Là một thi sĩ nên khi giải thích về các sự trái ngược trong đời sống, Thầy đã nhẹ nhàng vén bức màn vô minh ảo tưởng dùm chúng ta, cho phép chúng ta (có lẽ lần đầu tiên trong đời) được biết rằng sự kinh hoàng về cái chết chỉ có nguyên nhân là các ý niệm và hiểu biết sai lầm của chính mình mà thôi.<br><br>Tri kiến về sống, chết của Thầy vô cùng vi tế và đẹp đẽ. Cũng như những điều vi tế, đẹp đẽ khác, cách thưởng thức hay nhất là thiền quán trong thinh lặng. Lòng nhân hậu và từ bi phát xuất từ suối nguồn thâm tuệ của Thiền sư Thích Nhất Hạnh là một loại thuốc chữa lành những vết thương trong trái tim chúng ta.</p><p>Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....</p>','https://i.ibb.co/bWdLqrq/1e8879b20f37a74b93bd7b6dd0e64e13-png.webp','Không Diệt Không Sinh Đừng Sợ Hãi (TB5)',76500,1),(6,'<h2>Thông Tin Chi Tiết</h2><figure class=\"table\"><table><tbody><tr><td>Công ty phát hành</td><td>Woobobooks</td></tr><tr><td>Dịch Giả</td><td>Phạm Quỳnh Giang</td></tr><tr><td>Số trang</td><td>256</td></tr><tr><td>Nhà xuất bản</td><td>Nhà Xuất Bản Thanh Niên</td></tr></tbody></table></figure><h2>Mô Tả Sản Phẩm</h2><p><strong>Cuốn sách về mối quan hệ giữa người với người dành cho “tôi” chứ không phải cho một ai khác.</strong></p><p><i>★&nbsp;</i>Đã bán được 400.000 bản (tính đến cuối năm 2021)<br><i>★</i>&nbsp;Được xuất bản tại 9 quốc gia<br><i>★&nbsp;</i>Giữ vững vị trí số 1 danh mục \"Quà tặng bán chạy nhất\" trên Kakaotalk trong thời gian dài<br><i>★&nbsp;</i>Giữ vững vị trí bestseller dòng Tản Văn suốt 142 tuần - kể từ khi ra mắt đến nay<br><i>★&nbsp;</i>Cuốn sách đã thổi làn gió mới trong mối quan hệ giữa người với người<br><i>★&nbsp;</i>Cuốn sách mang đến niềm an ủi lớn nhất cho những con người hiện đại đang chịu tổn thương bởi các mối quan hệ<br><br>&nbsp;</p><p>Tôi sống mà phải chịu tổn thương bởi sự can thiệp quá mức của người khác dưới danh nghĩa đang lo lắng hộ tôi và những lời nói vô duyên dưới lớp vỏ bọc lời khuyên. Tôi được học cách sống hoà đồng cùng bạn bè, trong khi không một ai dạy tôi về ý nghĩa của tình bạn thực sự. Tôi toàn nghe người ta nói hãy trở thành một người tử tế và tốt bụng, mà chưa bao giờ được học cách sống chung với những kẻ xấc xược và xấu xa.</p><p>Tác giả đã trực tiếp va chạm, tổn thương và khóc vô số lần khi phải đối mặt với những vấn đề về mối quan hệ giữa người với người gặp phải trong cuộc sống hằng ngày, và ghi lại trải nghiệm trong cuốn sách. Đó là dũng cảm tránh xa những người thô lỗ, cách phân biệt tình bạn thật sự và cách làm thế nào để không đánh mất chính mình trong tình yêu.</p><p>Tác giả Kim Yoo Eun đã tổ chức hàng chục nghìn buổi tư vấn và buổi diễn thuyết miễn phí, lắng nghe những nỗi lo âu của mọi người và đề xuất những giải pháp để vượt qua, tháo gỡ những khó khăn trong mối quan hệ giữa người với người, giúp họ có niềm tin tiến về phía trước. Nó mang đến sự an ủi ấm áp để bạn có thể sống đúng với chính mình chứ không phải để phù hợp với người khác.</p><p>&nbsp;</p><p><strong>ĐÔI LỜI TỪ CHUYÊN GIA VỀ SÁCH (BOOK SOMMELIER)</strong></p><p>Một tản văn đẹp</p><p>nơi mà chúng ta có thể nhìn lại cuộc sống mà chúng ta đang phải chống chọi, và cảm nhận được ý nghĩa thực sự của các mối quan hệ giữa người với người trong trái tim mình. Cuốn sách sẽ mang đến sự thư thái cho tâm hồn của những con người hiện đại đang phải vật lộn với mớ cảm xúc hoài nghi về các mối quan hệ giữa con người với nhau. Dù tôi biết mối quan hệ giữa người với người mang tính chủ quan và thay đổi liên tục, rất khó để theo ý mình. Nếu cứ liên tục mong đợi rồi lại thất vọng về mối nhân duyên đã có với nhau, dần dà bạn sẽ thấy mình kiệt sức.</p><p><i>“Bạn không cần tỏ ra tử tế và gần gũi với tất cả mọi người.</i><br><i>Giữ cự ly không quá gần, cũng chẳng quá xa,</i><br><i>Và cứ thế sống cuộc đời của chính bạn là được.</i><br><i>Hãy duy trì một khoảng cách vừa đủ.”</i><br>- Trích trang 213 “Khoảng cách an toàn trong một mối quan hệ”</p><p>Ngày càng có nhiều những cuộc trò chuyện mà tôi phải nghe những lời không muốn nghe, nhưng vẫn phải ráng chịu đựng, phải vờ như không biết bạn đang khoe khoang và âm thầm xem thường tôi. Giờ tôi đã quá kiệt sức với những người ích kỷ ném những lời nói vô tình như những hòn đá cuội ném vào đầu, và tôi sẽ nói cho bạn biết khoảng cách an toàn trong một mối quan hệ. Tác giả đưa ra câu trả lời cho các mối quan hệ giữa người với người mà ta đang có và giải đáp hàng chục nghìn các buổi tư vấn tâm lý và những chuyện bản thân ta gặp phải. Không cần phải trở thành một người tốt bằng cách gò mình vào tiêu chuẩn do người khác đặt ra. Bản thân chúng ta đã đủ tốt rồi, nên nhấn mạnh lại cách xác định tiêu chuẩn của chính mình và tự tin tiến về phía trước.</p><p><i>“Chúng ta đã và đang làm rất tốt,</i><br><i>nên đừng chùn bước trước những khó khăn tạm thời trước mắt.</i><br><i>Chúng ta chỉ việc tin tưởng vào hướng đi mình đã chọn và bước tiếp.</i><br><i>Phải có những trận cuồng phong thì ngọn sóng mới dâng trào mạnh mẽ.”</i><br>- Trích trang 35 “Bước tiếp cho ngày mai”</p><p>Tác giả đưa ra lời an ủi về việc lo lắng bản thân có đang làm tốt hay không, hay nhìn lại quá khứ là điều đương nhiên. Cuốn sách nói rằng không phải chúng ta đang làm sai, mà đó sẽ trở thành động lực giúp chúng ta bước tiếp cho ngày mai. Những câu nói ấm áp sẽ ôm lấy bạn để bạn không gục ngã ngay cả những ngày thấy bản thân mình thật nhỏ bé chẳng là gì, hay những ngày trái tim bạn đau đớn vì ai đó. Nếu có khoảnh khắc khiến bạn chao đảo trước khó khăn, những câu chuyện sẽ giúp chân bạn đứng vững.</p><p><i>“Khổ vì yêu, khổ vì giữ, khổ vì đau.”</i><br>- Trích trang 141 “Tình yêu ấy đã khiến bạn khổ quá rồi”</p><p>Cuốn sách cho thấy các nhiệt độ khác nhau trong mối quan hệ của những người gặp nhau rồi yêu nhau. Những câu chuyện về sự chia tay bắt đầu từ sự rung động của trái tim đến cả nỗi đau xé lòng. Những tập phim đan xen về những xung đột lớn nhỏ nảy sinh khi hai người sống cuộc đời khác nhau trở thành mảnh ghép của nhau, và tôi thử nghĩ về một mối quan hệ yêu đương tốt đẹp thêm một lần nữa. Tác giả cũng nói đến cách yêu mà hai người phải cùng nhau nỗ lực chứ không phải chỉ một người hy sinh vun vén để xứng đôi. Nó cho thấy một tình yêu bền chặt nhưng không vì tình yêu mà đánh mất đi chính bản thân mình.</p><p>Cuốn sách “Đừng cố làm người tốt trong mắt tất cả mọi người” như một món quà bảo vệ cứng cáp có thể bảo vệ bạn khỏi những vấn đề khác nhau trong mối quan hệ giữa người với người mà bạn gặp phải trong cuộc sống hằng ngày. Nó động viên khi lòng tự tôn sụp đổ, an ủi cho mối quan hệ đã đi đến hồi kết, và tiếp thêm dũng khí bước tiếp.</p><p>&nbsp;</p>','https://i.ibb.co/zVWgnWz/41ddeda3131acfd9644ed50d94b991ae-png.webp','Đừng Cố Làm Người Tốt Trong Mắt Tất Cả Mọi Người rrtrt',93000,7),(7,'<h2>Mô Tả Sản Phẩm</h2><p>Dragon Ball là bộ truyện tranh nhiều tập được viết và vẽ minh họa bởi Toriyama Akira. Loạt truyện tranh bắt đầu xuất bản hàng tuần trong tạp chí Weekly Shōnen Jump từ năm 1984 đến 1995 với 519 chương và sau đó được xuất bản trong 42 tập truyện dày bởi nhà xuất bản Shueisha.</p>','https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSIROK-0Yt9HyxcXPeijq0_JFhMLExN4BFPQhgyi2ImggoBeplQ','7 viên ngọc rồng',150000,2),(8,'<h2>Mô Tả Sản Phẩm</h2><p>One Piece, từng được xuất bản tại Việt Nam dưới tên gọi Đảo Hải Tặc là bộ manga dành cho lứa tuổi thiếu niên của tác giả Oda Eiichiro, được đăng định kì trên tạp chí Weekly Shōnen Jump, ra mắt lần đầu trên ấn bản số 34 vào ngày 19 tháng 7 năm 1997.</p>','https://upload.wikimedia.org/wikipedia/en/thumb/9/90/One_Piece%2C_Volume_61_Cover_%28Japanese%29.jpg/220px-One_Piece%2C_Volume_61_Cover_%28Japanese%29.jpg','One Piece',270000,2),(9,'<h2>Mô Tả Sản Phẩm</h2><p>Thần đồng Đất Việt là một bộ truyện tranh thiếu nhi Việt Nam do họa sĩ Lê Linh sáng tác và phát hành bởi công ty Phan Thị cùng với sự phối hợp của nhà xuất bản Trẻ. Bộ truyện diễn tả lại cuộc sống và những nét văn hoá của người Việt dưới thời phong kiến. Được phát sóng trên kênh VTV3 và VTC1 năm 2006.</p>','https://upload.wikimedia.org/wikipedia/vi/2/23/Than_dong_dat_viet.jpg','Thần đồng Đất Việt',80000,2),(10,'<h2>Mô Tả Sản Phẩm</h2><p>Vào đầu thế kỷ XV, liên minh Ba Lan - Litva hùng mạnh đã trở thành chướng ngại vật chính ngăn cản sự bành trướng của dòng tu Ki-tô giáo mang tên Giáo đoàn Thánh chiến. Việc hiệp sĩ trẻ Zbyszko tấn công sứ giả của Giáo đoàn và phải lên đoạn đầu đài lại càng làm mâu thuẫn này thêm trầm trọng, kéo theo màn “mỹ nhân cứu anh hùng” cùng những cuộc trả đũa về sau - tất cả góp phần thổi bùng ngòi lửa chiến tranh đã âm ỉ từ lâu.</p>','https://product.hstatic.net/1000328521/product/combo_b2e54ba2cf514bfa888dc40b61bc1b59_large.jpg','Hiệp sĩ Thánh chiến',360000,5),(11,'<h2>Mô Tả Sản Phẩm</h2><p>Câu chuyện nghệ thuật - cẩm nang về các trào lưu, các tác phẩm, chủ đề và kĩ thuật chính yếu trong nghệ thuật. Cuốn sách là một bước dạo đầu mới lạ vào chủ đề nghệ thuật. Với kết cấu đơn giản, cuốn sách này điểm qua 50 tác phẩm then chốt, từ các bức vẽ trên vách động Lascaux tới những tác phẩm sắp đặt đương đại, và liên hệ các tác phẩm ấy với những trào lưu, chủ đề cùng kĩ thuật chính yếu trong nghệ thuật. Dễ tiếp cận, súc tích và giàu minh họa, Câu chuyện nghệ thuật sẽ giải thích nghệ thuật đã thay đổi vì đâu, vào thời điểm nào, như thế nào; những ai tiên phong sáng tạo các ý niệm, các ý niệm ấy có khởi nguồn, bối cảnh thành hình và tầm quan trọng ra sao. Cuốn sách này sẽ lí giải tường minh các thuật ngữ nghệ thuật, cho độc giả kiến thức bao quát và sự am hiểu thấu triệt để thưởng thức nghệ thuật qua các thời kì.</p>','https://product.hstatic.net/1000328521/product/3d__cau_chuyen_nghe_thuat_5cabec4674ab42eea1739c02cd6e5954_large.jpg','Câu chuyện nghệ thuật',240000,3),(12,'<h2>Mô Tả Sản Phẩm</h2><p>Bộ sách được viết bởi các chuyên gia hàng đầu và minh họa bởi các họa sĩ giàu kinh nghiệm. Cả 8 cuốn được in màu toàn bộ trên giấy chất lượng cao, màu sắc và hình ảnh sống động, hy vọng sẽ đem đến cho bạn đọc góc nhìn thú vị về những con người đã góp phần làm nên diện mạo của hội họa phương Tây và thế giới</p>','https://product.hstatic.net/1000328521/product/warhol_c9c8fa36816348408a536baf0ec1bac7_large_a33cf7338f984fe98691512a41df187e.jpg','Bộ Đây Là (Cuốn Lẻ Và Combo)',120000,3),(13,'<h2>Mô Tả Sản Phẩm</h2><p>Đây là Gauguin kể về cuộc đời và sự nghiệp của họa sỹ Hậu Ấn tượng vĩ đại người Pháp Gauguin, từ cậu bé có thân thế đặc biệt đến chàng trai thích phiêu lưu, mạo hiểm rồi trở thành một viên chức môi giới chứng khoán và cuối cùng lựa chọn nghệ thuật là lối thoát giúp ông trốn khỏi cái cuộc sống tù hãm. Ông đã vẽ những bức tranh đẹp nhất đời mình tại Tahiti – nơi ông xem là thiên đường nhiệt đới còn giữ vẻ hoang sơ của thiên nhiên và bản tính con người.</p>','https://product.hstatic.net/1000328521/product/gauguin_d311f76943d343189be9b814a05e1e38_large.jpg','Đây là Gauguin',120000,3),(14,'<h2>Mô Tả Sản Phẩm</h2><p>Đây là Matisse kể về cuộc đời và sự nghiệp của một trong những nhân vật đi đầu trong nghệ thuật hiện đại - Henri Matisse (1869 - 1954). Sự nghiệp họa sỹ của Matisse gần như bắt rễ từ văn hóa nghề thủ công ở Bohain - quê nhà của ông. Là nhân vật tiên phong của trường phái Dã thú, vào thập niên 1920, Matisse được coi là một trong những người nâng tầm truyền thống cổ điển trong hội họa Pháp. Trải qua nửa đầu đầy giông bão của thế kỷ 20 và cái mà Matisse gọi là “căn bệnh tập thể của con tim”, toàn bộ sự nghiệp ông là một nỗ lực miệt mài nhằm tìm kiếm và khẳng định cái phong phú và vẻ đẹp của sự sống giữa những hỗn độn và khốn cùng.</p>','https://product.hstatic.net/1000328521/product/matisse_07791c9ee3ca4d8c86530f5b56285605_large.jpg','Đây là Matisse',120000,3),(15,'<h2>Mô Tả Sản Phẩm</h2><p>Tôi Vẽ - với 300 trang sách bao gồm những kỹ năng cơ bản cần có của một họa sĩ truyện tranh, từ tạo hình nhân vật, thiết kế bối cảnh, biểu cảm, các kỹ thuật diễn họa cho đến luật phối cảnh. Đây là một cuốn cẩm nang tuyệt vời dành cho các bạn đang bắt đầu học vẽ truyện tranh. Những kiến thức này có thể không giúp các bạn vẽ đẹp ngay lập tức nhưng sẽ là nền tảng vững chắc giúp bạn hình thành các tiêu chuẩn chuyên nghiệp trong nghề và không mất thời gian tự mò mẫm. Phần minh họa cho các bài học cũng rất hấp dẫn và sáng tạo. Các tác giả đã sử dụng chính nhân vật và trang truyện của mình để làm rõ sự liên quan giữa lý thuyết và thực tế, tính ứng dụng rõ ràng của các kỹ thuật và quy trình sáng tác.</p>','https://product.hstatic.net/1000328521/product/3423fd71e65901075848_4b4571e9e503456bb42125cf871b6dc5_large.jpg','Tôi Vẽ - Phương Pháp Tự Học Vẽ Truyện Tranh',80000,3),(16,'<h2>Mô Tả Sản Phẩm</h2><p>Tây du ký là do chuyện một đồ đệ Phật giáo đi lấy kinh phát triển, biến diễn ra mà có. Trong quá trình phát triển ở dân gian, đặc biệt là sau khi đã qua tay Ngô Thừa Ân gọt giũa lại, câu chuyện đi lấy kinh đã từ một truyện ký của tín đồ tôn giáo biến thành một pho anh hùng truyền kỳ thần thoại.</p>','https://product.hstatic.net/1000328521/product/tay_du_ky___qua_tang__52e8c7d875a640e1ac85d1cf45b11843_large.jpg','Tây du ký - Bộ hộp 3 tập - Tặng ngẫu nhiên 1 mô hình nhân vật trong 4 thầy trò Đường Tăng (Số lượng có hạn)',520000,4),(17,'<h2>Mô Tả Sản Phẩm</h2><p>Hán Sở diễn nghĩa (tên gốc Tây Hán diễn nghĩa) là trước tác của Chung Sơn cư sỹ Chân Vĩ, vốn quen thuộc với độc giả Việt Nam qua cái tên Hán Sở tranh hùng. Lần này, qua bản dịch mới mẻ và đầy đủ 101 hồi của dịch giả Châu Hải Đường, một lần nữa quá khứ bi hùng về cuộc chiến giữa Lưu Bang và Hạng Vũ cách đây hơn hai nghìn năm lại như sống dậy trước mắt độc giả. Qua ngòi bút kiệt xuất của tác giả, ta thấy cái tài của người làm tướng quyết thắng ngoài nghìn dặm, cái trung của kẻ làm tôi hy sinh cứu chúa, cái dũng của tướng sỹ công thành hạ địch, cái mưu của kẻ sỹ quy phục chư hầu. Hòa mình vào Hán Sở diễn nghĩa, ta còn khắc khoải với những thành bại được mất tự nghìn xưa, hào hứng theo giấc mộng đồ vương định bá, và cũng xót xa cho thân phận chinh nhân trong những trận chiến một mất một còn. Bi và hùng đan xen hoà lẫn, Hán Sở diễn nghĩa đã tạo nên một thiên anh hùng ca rất riêng.</p>','https://product.hstatic.net/1000328521/product/untitled-1_378b746a19504c25b1ac16ae3dbd7c1d_large.jpg','Hán Sở diễn nghĩa (bản dịch mới)',152000,4),(18,'<h2>Mô Tả Sản Phẩm</h2><p>Kể từ lần xuất bản đầu tiên năm 1957, sự ưu ái của độc giả trong suốt hơn nửa thế kỉ qua đã khẳng định giá trị nội dung và mĩ thuật của bộ truyện tranh liên hoàn họa lớn nhất Trung Quốc này. “Có thể khẳng định Tam Quốc diễn nghĩa liên hoàn họa không chỉ mở ra thời đại hoàng kim của thể loại liên hoàn họa mà còn xứng đáng là một biểu tượng văn hóa của thời đại.”– Nhà văn Mao Tiêm</p>','https://product.hstatic.net/1000328521/product/thumb_tam_quoc_60t_dd836b3efb6a4391a0900cec27e3feb0_large.jpg','Bộ sách: Tam quốc diễn nghĩa liên hoàn họa (trọn bộ 60 tập)',525000,4),(19,'<h2>Mô Tả Sản Phẩm</h2><p>Tam Quốc diễn nghĩa là pho tiểu thuyết lịch sử ưu tú của nền văn học cổ Trung Quốc được độc giả khắp thế giới yêu thích, say mê. Ở nước ta trước đây, Tam Quốc diễn nghĩa đã được dịch ra nhiều bản, trong số đó bản của cụ cử Phan Kế Bính được hoan nghênh hơn cả. Tiếc rằng bản dịch này dựa theo nguyên bản Tam Quốc diễn nghĩa cũ, trong đó có những điểm không được chính xác. Trong bản in tác phẩm này của NXB Phổ Thông năm 1959, cụ phó bảng Bùi Kỷ đã được mời tham gia hiệu đính bằng cách đem đối chiếu với bộ Tam quốc diễn nghĩa của Nhân dân văn học xã xuất bản năm 1958. Kỷ niệm 50 năm NXB Phổ thông lần đầu ra mắt bộ Tam quốc diễn nghĩa 13 tập (1959-2009), Công ty văn hóa Đông A đã chính thức phát hành lại bộ sách quý này dành cho bạn đọc chơi sách và mê truyện Tam Quốc diễn nghĩa.</p>','https://product.hstatic.net/1000328521/product/3d_hop_tam_quoc_dien_nghia__13_tap__6985b7b5ea374c4ba03d2246ea9eb3d4_large.jpg','Tam Quốc diễn nghĩa (Trọn bộ 13 tập)',273000,4),(20,'<h2>Mô Tả Sản Phẩm</h2><p>Đông Chu liệt quốc là bộ tiểu thuyết đồ sộ gồm 108 hồi, phản ánh giai đoạn 550 năm bão táp của lịch sử Trung Hoa từ thời Xuân Thu đến Chiến Quốc. Năm thế kỉ tranh hùng đồ bá ấy với hàng trăm sự kiện và nhân vật được miêu tả sống động mà gãy gọn, lúc căng lúc chùng, lúc lên lúc xuống. Dưới ngòi bút tinh mĩ ấy, trước tác của Phùng Mộng Long không còn gói gọn trong khuôn khổ của những tiểu thuyết diễn nghĩa đương thời mà đã trở thành một kho sử liệu ngồn ngộn nhưng rành rẽ, tạo được niềm say mê, thích thú đối với độc giả.</p>','https://product.hstatic.net/1000328521/product/88d4fcfb959a8876255b48734d7d679c_large.jpg','Đông Chu Liệt Quốc (bộ 6 tập)',360000,4),(21,'<h2>Mô Tả Sản Phẩm</h2><p>Alice ở xứ sở diệu kì và Alice ở xứ sở trong gương là hai cuốn tiểu thuyết thiếu nhi nổi tiếng của nhà văn người Anh, Lewis Carroll. Ngay khi Alice ở xứ sở diệu kì - phần 1 cuốn sách được xuất bản năm 1865, cuốn truyện đã được đông đảo bạn đọc cả trẻ em lẫn người lớn yêu mến. Bảy năm sau, Lewis Carroll cho ra mắt phần tiếp theo, Alice ở xứ sở trong gương, và ngay lập tức những nhân vật như cặp anh em Tweedledum, Hậu Đỏ, Hậu Trắng…của phần này cũng trở nên nổi tiếng không kém Thỏ Trắng, Sâu bướm, nữ Công tước hay Vua Cơ và Hậu Cơ ở phần trước.</p>','https://product.hstatic.net/1000328521/product/alice_21241b0e7d4a4677b76cc25438abef5c_large.jpg','Alice ở xứ sở diệu kì và Alice ở xứ sở trong gương',440000,5),(22,'<h2>Thông Tin Chi Tiết</h2><figure class=\"table\"><table><tbody><tr><td>Công ty phát hành</td><td>First News - Trí Việt</td></tr><tr><td>Kích thước</td><td>14.5 x 20.5 cm</td></tr><tr><td>Loại bìa</td><td>Bìa gập</td></tr><tr><td>Số trang</td><td>408</td></tr><tr><td>Nhà xuất bản</td><td>Nhà Xuất Bản Tổng hợp TP.HCM</td></tr></tbody></table></figure><h2>Mô Tả Sản Phẩm</h2><p><img src=\"https://salt.tikicdn.com/ts/tmp/fe/a5/01/3a3c59ee365a3978eafa9a83859def75.jpg\" alt=\"Muôn Kiếp Nhân Sinh (Many Lives - Many Times)\"></p><p>“Muôn kiếp nhân sinh” là tác phẩm do Giáo sư John Vũ - Nguyên Phong viết từ năm 2017 và hoàn tất đầu năm 2020 ghi lại những câu chuyện, trải nghiệm tiền kiếp kỳ lạ từ nhiều kiếp sống của người bạn tâm giao lâu năm, ông Thomas – một nhà kinh doanh tài chính nổi tiếng ở New York. Những câu chuyện chưa từng tiết lộ này sẽ giúp mọi người trên thế giới chiêm nghiệm, khám phá các quy luật về luật Nhân quả và Luân hồi của vũ trụ giữa lúc trái đất đang gặp nhiều tai ương, biến động, khủng hoảng từng ngày.</p><p>“Muôn kiếp nhân sinh” là một bức tranh lớn với vô vàn mảnh ghép cuộc đời, là một cuốn phim đồ sộ, sống động về những kiếp sống huyền bí, trải dài từ nền văn minh Atlantis hùng mạnh đến vương quốc Ai Cập cổ đại của các Pharaoh quyền uy, đến Hợp Chủng Quốc Hoa Kỳ ngày nay.</p><p>“Muôn kiếp nhân sinh” cung cấp cho bạn đọc kiến thức mới mẻ, vô tận của nhân loại lần đầu được hé mở, cùng những phân tích uyên bác, tiên đoán bất ngờ về hiện tại và tương lai thế giới của những bậc hiền triết thông thái. Đời người tưởng chừng rất dài nhưng lại trôi qua rất nhanh, sinh vượng suy tử, mong manh như sóng nước. Luật nhân quả cực kỳ chính xác, chi tiết, phức tạp được thu thập qua nhiều đời, nhiều kiếp, liên hệ tương hỗ đan xen chặt chữ lẫn nhau, không ai có thể tính được tích đức này có thể trừ được nghiệp kia không, không ai có thể biết được khi nào nhân sẽ trổ quả. Nhưng, một khi đã gây ra nhân thì chắc chắn sẽ gặt quả - luật Nhân quả của vũ trụ trước giờ không bao giờ sai.</p><p>Luật Luân hồi và Nhân quả đã tạo nhân duyên để người này gặp người kia. Gặp nhau có khi là duyên, có khi là nợ; gặp nhau có lúc để trả nợ, có lúc để nối lại duyên xưa. Có biết bao việc diễn ra trong đời, tưởng chừng như là ngẫu nhiên nhưng thật ra đã được sắp đặt từ trước. Luân hồi là một ngôi trường rộng lớn, nơi tất cả con người, tất cả sinh vật đều phải học bài học của riêng mình cho đến khi thật hoàn thiện mới thôi. Nếu không chịu học hay chưa học được trọn vẹn thì buộc phải học lại, chính xác theo quy luật của Nhân quả.</p><p>Thomas đã chia sẻ vì sao đã kể những câu chuyện riêng tư huyền bí này với Giáo sư John Vũ để thực hiện tác phẩm “Muôn kiếp nhân sinh”:</p><ul><li>“Hiện nay thế giới đang trải qua giai đoạn hỗn loạn, xáo trộn, mà thật ra thì mọi quốc gia đều đang gánh chịu những nghiệp quả mà họ đã gây ra trong quá khứ. Mỗi quốc gia, cũng như mọi cá nhân, đều có những nghiệp quả riêng do những nhân mà họ đã gây ra. Cá nhân thì có ‘biệt nghiệp‘ riêng của từng người, nhưng quốc gia thì có ‘cộng nghiệp‘ mà tất cả những người sống trong đó đều phải trả.</li><li>Thường thì con người, khi hành động, ít ai nghĩ đến hậu quả, nhưng một khi hậu quả xảy đến thì họ nghĩ gì, làm gì? Họ oán hận, trách trời, trách đất, trách những người chung quanh đã gây ra những hậu quả đó? Có mấy ai biết chiêm nghiệm, tự trách mình và thay đổi không?</li><li>Tôi mong chúng ta - những cánh bướm bé nhỏ rung động mong manh cũng có thể tạo nên những trận cuồng phong mãnh liệt để thức tỉnh mọi người.</li><li>Tương lai của mỗi con người, mỗi tổ chức, mỗi quốc gia và cả hành tinh này sẽ ra sao trong giai đoạn sắp tới là tùy thuộc vào thái độ ứng xử, nhìn nhận và thức tỉnh của từng cá nhân, từng tổ chức, từng quốc gia đó tạo nên. Nếu muốn thay đổi, cần khởi đầu bằng việc nhận thức, chuyển đổi tâm thức, lan tỏa yêu thương và chia sẻ sự hiểu biết từ mỗi người chúng ta trước.</li></ul><p>Nhân quả đừng đợi thấy mới tin.<br>Nhân quả là bảng chỉ đường, giúp con người tìm về thiện lương“</p><p>“Muôn kiếp nhân sinh” có hai khổ, bìa mềm khổ 14cmx 20.5cm, bìa cứng khổ 16x24cm ruột giấy Ford kem Nhật Bản 80 gsm, in 3 màu kèm 16 phụ bản màu. Cuốn sách được xuất bản bằng tiếng Việt trước khi được chuyển nhượng bản quyền cho các quốc gia khác trên thế giới.</p><p>Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....</p>','https://i.ibb.co/Sy5YVF6/e2aed009bb558b5d2cfbbe157b428ba4-jpg.webp','Sách Muôn Kiếp Nhân Sinh (Bìa Mềm) - Nguyên Phong',163000,21),(23,'<h2>Thông Tin Chi Tiết</h2><figure class=\"table\"><table><tbody><tr><td>Công ty phát hành</td><td>Thái Hà</td></tr><tr><td>Nhà xuất bản</td><td>Nhà Xuất Bản Hà Nội</td></tr></tbody></table></figure><h2>Mô Tả Sản Phẩm</h2><p><strong>Truyện Tranh : Spy Room - Lớp Học Điệp Viên (Tập 4)</strong></p><p>ThaiHaBooks] Spy room – Lớp học điệp viên (tên gốc: Spy kyoushitsu)&nbsp;là series light novel độc đáo về thể loại điệp viên, tình báo vốn rất hiếm hoi trong dòng manga/light novel, là cái tên xuất sắc đã giành giải nhất giải thưởng thường niên của Fantasia Bunko lần thứ 32. Trong năm đầu tiên ra mắt, 2020, chỉ với 4 tập truyện thì Spy Room đã tạo tiếng vang lớn, đứng top 2 bảng xếp hạng light novel yêu thích Kono Light novel ga sugoi! ở cả 2 hạng mục Light novel mới hay nhất và Light novel hay nhất. Tính đến thời điểm hiện tại, series đã cán mốc 400.000 bản được bán ra tại Nhật Bản.</p><p>Tên sát thủ tàn nhẫn và lãnh khốc “Shikabane” đã xâm nhập vào nước Cộng hoà Deen để tiến hành những vụ ám sát các chính trị gia tên tuổi của cộng hoà. Đội điệp viên phụ trách tiêu diệt Shikabane đã thất bại mà chẳng thu được thông tin nào, phòng tình báo đối ngoại đã liệt nhiệm vụ này vào nhóm bất khả thi. Tức, từ giờ phút này, đội Tomoshibi sẽ tiếp nhận nhiệm vụ.</p><p>&nbsp;</p><p>Để đối phó và đánh lạc hướng Shikabane, Klaus đã chia Tomoshibi thành 2 nhóm nhỏ. Một nhóm gồm những thành viên ưu tú nhất sẽ cùng anh trực tiếp đối đầu với Shikabane. Nhóm còn lại gồm những thành viên giỏi hợp tác với nhau, có thể hoạt động mà không cần sự chỉ đạo của anh, nhằm lật tẩy tên đồng phạm đang ẩn náu và hỗ trợ cho Shikabane tại tư dinh của một chính khách máu mặt tên Uwell.</p><p>&nbsp;</p><p>Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....</p>','https://i.ibb.co/GdDhVvk/c8cfef35c8f75d8e974881817e6ffa08-png.webp',' Truyện Tranh : Spy Room - Lớp Học Điệp Viên (Tập 4)',103000,21),(24,'<h2>Thông Tin Chi Tiết</h2><figure class=\"table\"><table><tbody><tr><td>Công ty phát hành</td><td>Timebooks</td></tr><tr><td>Ngày xuất bản</td><td>2021-05-06 15:24:44</td></tr><tr><td>Loại bìa</td><td>Bìa mềm</td></tr><tr><td>Số trang</td><td>160</td></tr><tr><td>Nhà xuất bản</td><td>NXB Dân Trí</td></tr></tbody></table></figure><h2>Mô Tả Sản Phẩm</h2><p>Thỏ Bảy Màu là một nhân vật hư cấu chẳng còn xa lạ gì với anh em dùng mạng xã hội với slogan “Nghe lời Thỏ, kiếp này coi như bỏ!”.</p><p>&nbsp;</p><p>Thỏ Bảy Màu đơn giản chỉ là một con thỏ trắng với sự dở hơi, ngang ngược nhưng đáng yêu vô cùng tận. Nó luôn nghĩ rằng mình không có cuộc sống và không có bạn bè. Tuy nhiên, Thỏ lại chẳng bao giờ thấy cô đơn vì đến cô đơn cũng bỏ nó mà đi.</p><p>&nbsp;</p><p>Cuốn sách là những mẩu chuyện nhỏ được ghi lại bằng tranh xoay quanh Thỏ Bảy Màu và những người nghĩ nó là bạn. Những mẩu chuyện được truyền tải rất “teen” đậm chất hài hước, châm biếm qua sự sáng tạo không kém phần “mặn mà” của tác giả càng trở nên độc đáo và thu hút.</p><p>&nbsp;</p><p>Nếu một ngày bạn lỡ cảm thấy buồn thì hãy đọc cuốn sách này để biết thế nào là cười sảng nha!</p><p>Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....</p>','https://i.ibb.co/q0YW3k7/751f78016eb5eea6547d9feca071fdb5-jpg.webp','Thỏ Bảy Màu Và Những Người Nghĩ Nó Là Bạn',94000,1),(25,'<h2>Thông Tin Chi Tiết</h2><figure class=\"table\"><table><tbody><tr><td>Công ty phát hành</td><td>Nhã Nam</td></tr><tr><td>Kích thước</td><td>14 x 20.5 cm</td></tr><tr><td>Dịch Giả</td><td>Nguyễn Bích Lan&nbsp;,&nbsp;Tô Yến Ly</td></tr><tr><td>Loại bìa</td><td>Bìa mềm</td></tr><tr><td>Số trang</td><td>244</td></tr><tr><td>Nhà xuất bản</td><td>Nhà Xuất Bản Hội Nhà Văn</td></tr></tbody></table></figure><h2>Mô Tả Sản Phẩm</h2><p>“Vị chua chát của cái nghèo hòa trộn với vị ngọt ngào khi khám phá ra những điều khiến cuộc đời này đáng số một tác phẩm kinh điển của Brazil.”</p><p>- Booklist</p><p>“Một cách nhìn cuộc sống gần như hoàn chỉnh từ con mắt trẻ thơ… có sức mạnh sưởi ấm và làm tan nát cõi lòng, dù người đọc ở lứa tuổi nào.”</p><p>- The National</p><p>Hãy làm quen với Zezé, cậu bé tinh nghịch siêu hạng đồng thời cũng đáng yêu bậc nhất, với ước mơ lớn lên trở thành nhà thơ cổ thắt nơ bướm. Chẳng phải ai cũng công nhận khoản “đáng yêu” kia đâu nhé. Bởi vì, ở cái xóm ngoại ô nghèo ấy, nỗi khắc khổ bủa vây đã che mờ mắt người ta trước trái tim thiện lương cùng trí tưởng tượng tuyệt vời của cậu bé con năm tuổi.</p><p>Có hề gì đâu bao nhiêu là hắt hủi, đánh mắng, vì Zezé đã có một người bạn đặc biệt để trút nỗi lòng: cây cam ngọt nơi vườn sau. Và cả một người bạn nữa, bằng xương bằng thịt, một ngày kia xuất hiện, cho cậu bé nhạy cảm khôn sớm biết thế nào là trìu mến, thế nào là nỗi đau, và mãi mãi thay đổi cuộc đời cậu.<br>Mở đầu bằng những thanh âm trong sáng và kết thúc lắng lại trong những nốt trầm hoài niệm, Cây cam ngọt của tôi khiến ta nhận ra vẻ đẹp thực sự của cuộc sống đến từ những điều giản dị như bông hoa trắng của cái cây sau nhà, và rằng cuộc đời thật khốn khổ nếu thiếu đi lòng yêu thương và niềm trắc ẩn. Cuốn sách kinh điển này bởi thế không ngừng khiến trái tim người đọc khắp thế giới thổn thức, kể từ khi ra mắt lần đầu năm 1968 tại Brazil.</p><p><strong>Tác giả:</strong></p><p>JOSÉ MAURO DE VASCONCELOS (1920-1984) là nhà văn người Brazil. Sinh ra trong một gia đình nghèo ở ngoại ô Rio de Janeiro, lớn lên ông phải làm đủ nghề để kiếm sống. Nhưng với tài kể chuyện thiên bẩm, trí nhớ phi thường, trí tưởng tượng tuyệt vời cùng vốn sống phong phú, José cảm thấy trong mình thôi thúc phải trở thành nhà văn nên đã bắt đầu sáng tác năm 22 tuổi. Tác phẩm nổi tiếng nhất của ông là tiểu thuyết mang màu sắc tự truyện Cây cam ngọt của tôi. Cuốn sách được đưa vào chương trình tiểu học của Brazil, được bán bản quyền cho hai mươi quốc gia và chuyển thể thành phim điện ảnh. Ngoài ra, José còn rất thành công trong vai trò diễn viên điện ảnh và biên kịch.</p><p>Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....</p>','https://i.ibb.co/4mJmjJB/2a6154ba08df6ce6161c13f4303fa19e-jpg.webp','Cây Cam Ngọt Của Tôi',64000,1),(26,'<h2>Thông Tin Chi Tiết</h2><figure class=\"table\"><table><tbody><tr><td>Công ty phát hành</td><td>Nhã Nam</td></tr><tr><td>Ngày xuất bản</td><td>2017-04-01 00:00:00</td></tr><tr><td>Kích thước</td><td>14 x 20.5 cm</td></tr><tr><td>Loại bìa</td><td>Bìa mềm</td></tr><tr><td>Số trang</td><td>118</td></tr><tr><td>Nhà xuất bản</td><td>Nhà Xuất Bản Hà Nội</td></tr></tbody></table></figure><h2>Mô Tả Sản Phẩm</h2><p><strong>Những Giấc Mơ Ở Hiệu Sách Morisaki</strong></p><p>Bị người yêu lừa dối, Takako bỏ việc và rơi vào chuỗi ngày ngủ triền miên để trốn tránh nỗi buồn. Thế rồi, một cuộc điện thoại từ người cậu ruột cả 10 năm trời không gặp đã đánh thức cô khỏi cơn mộng mị. Takako đồng ý đến trông hiệu sách nửa buổi giúp cậu chỉ để làm vừa lòng mẹ. Nhưng thật ngoài tưởng tượng, chờ đợi cô là hiệu sách Morisaki cũ kỹ với thế giới của hàng nghìn cuốn sách chứa trong mình cả thời gian và lịch sử. Sách đã chữa lành vết thương trong lòng cô.</p><p>Và hơn thế nữa, Takako tìm thấy bao nhiêu điều mới mẻ và thú vị mà trước đây cô chưa từng biết đến.Câu chuyện nhẹ nhàng mà sâu lắng, đặc biệt với những ai có sở thích sưu tầm sách cổ.</p><p>Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....</p>','https://i.ibb.co/Kz5s8SF/1x2acr3d-u4972-d20170419-t115542-562440-jpg.webp','Những Giấc Mơ Ở Hiệu Sách Morisaki',100000,1),(27,'<h2>Mô Tả Sản Phẩm</h2><p>Trên thế giới đã có rất nhiều tác phẩm cảm động viết về chó, một loài vật thân thiết và gần gũi với con người. Tuy nhiên, có sức lay động như Con Bim trắng tai đen thì không tác phẩm nào sánh được, cho dù đó là Tiếng gọi của Hoang Dã, Nanh trắng hay Chó hoang Dingo. Hàng triệu độc giả đã khóc khi đọc tác phẩm này và không ít người sau đó đi lượm những con chó bơ vơ không chủ đem về nhà nuôi rồi đặt tên là Bim để tưởng nhớ tới chú chó săn bất hạnh. Chính vì thế, bài thơ bằng văn xuôi ca ngợi lòng thủy chung và sự tận tụy này được xếp vào một trong những tác phẩm đặc sắc của văn học thế kỷ XX.</p>','https://product.hstatic.net/1000328521/product/bia___pc_1200x1200_0321be945bbd44af9a59a0c8a77e29ff_large.jpg','Con Bim trắng tai đen (ấn bản mới) (tặng 02 postcards)',256000,5),(28,'<h2>Mô Tả Sản Phẩm</h2><p>Quanh cái “nhân vật chính” là nhà thờ Đức Bà, một xã hội Paris thời Trung cổ đã được tái hiện với tất cả những gì rạng rỡ nhất và suy đồi nhất của nó, không bỏ sót tầng lớp nào từ vua chúa đến thường dân và cả những kẻ dưới đáy xã hội. Trên nền “Lễ hội của những kẻ điên”, bánh xe số phận đã xoay vần, để các cuộc gặp gỡ định mệnh xảy đến giữa cô vũ nữ Esmeralda xinh đẹp và những người ái mộ nàng. Người mãnh liệt hết mình, kẻ qua quýt vờn quanh, người sẵn sàng hy sinh, kẻ không từ thủ đoạn – họ yêu theo nhiều cách khác biệt và “đã hại lẫn nhau vì trò đùa bí ẩn của định mệnh”. Trong trò chơi đuổi bắt trớ trêu mà ai cũng mải mê chạy theo cái bóng của ái tình, từng nhân vật đã bộc lộ ra những phẩm chất giấu kín bên trong họ, với những giằng xé hết sức con người mà ta chẳng bao giờ hiểu được nếu chỉ nhìn vào bề nổi của câu chuyện mang hơi hướm “người đẹp và quái vật” này.</p>','https://product.hstatic.net/1000328521/product/bia___pc_1200x1200_18c72007f4ad431eaa67d9ea6852be00_large.jpg','Nhà thờ Đức Bà Paris (tặng 02 postcards)',520000,5);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `quantity` int NOT NULL,
  `book_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1ykovbj90wkvqwa6m6463h21p` (`book_id`),
  KEY `FKg5uhi8vpsuy0lgloxk2h4w5o6` (`user_id`),
  CONSTRAINT `FK1ykovbj90wkvqwa6m6463h21p` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `FKg5uhi8vpsuy0lgloxk2h4w5o6` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (27,'2023-04-07 12:59:12.004000',1,24,4),(28,'2023-04-07 12:59:24.655000',2,24,4),(29,'2023-04-07 12:59:38.170000',1,26,4);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL,
  `category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Sách Y Học ',NULL,NULL),(2,'Sách thiếu nhi',NULL,NULL),(3,'Văn hóa - Nghệ thuật',NULL,NULL),(4,'Danh tác cổ điển Trung Hoa',NULL,NULL),(5,'Văn học nước ngoài',NULL,NULL),(6,'Văn học cổ điển',NULL,NULL),(7,'Sách kỹ năng sống',NULL,NULL),(21,'Truyện Tranh, Manga, Comic',NULL,NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (56);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitems`
--

DROP TABLE IF EXISTS `orderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitems` (
  `id` int NOT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKt6060jg4allcra1hegh1iih71` (`book_id`),
  KEY `FKm3mp87f5ygbbfuqfdhc09y9a` (`order_id`),
  CONSTRAINT `FKm3mp87f5ygbbfuqfdhc09y9a` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `FKt6060jg4allcra1hegh1iih71` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitems`
--

LOCK TABLES `orderitems` WRITE;
/*!40000 ALTER TABLE `orderitems` DISABLE KEYS */;
INSERT INTO `orderitems` VALUES (31,'2023-04-07 20:45:37.107000',256500,1,2,30),(37,'2023-04-08 00:12:33.953000',256500,1,2,36),(38,'2023-04-08 00:12:34.037000',94000,1,24,36),(43,'2023-04-08 00:54:42.141000',100000,1,26,42),(50,'2023-04-08 01:28:35.252000',100000,1,26,49),(51,'2023-04-08 01:28:35.341000',94000,1,24,49),(54,'2023-04-08 21:49:35.470000',520000,1,28,53);
/*!40000 ALTER TABLE `orderitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `session_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_price` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK32ql8ubntj5uh44ph9659tiih` (`user_id`),
  CONSTRAINT `FK32ql8ubntj5uh44ph9659tiih` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (30,'2023-04-07 20:45:37.045000','cs_test_a1sRkprrfRKT0Viun7K9dm6IY5gDd8823reX1gr3wRp3WXqIPZqigvK971',256500,12),(36,'2023-04-08 00:12:33.554000','cs_test_b16e8GNjezyz1RtRfySLgYZXKLaqIrhK3rw5RlIDX5Zyp164ZkOuPp64sR',350500,1),(42,'2023-04-08 00:54:41.607000','cs_test_a196IO8BHrR7Nbky1MRPEmVx8bEsX08CnyI7tSAwK4F2srFBtW2fJOk3aq',100000,1),(49,'2023-04-08 01:28:35.077000','cs_test_b1GOxV2w7XhN3i6B60PNqJ9RXFGNT0pMjAAzLXy7DbkIv47bP2fQGE1GDT',194000,39),(53,'2023-04-08 21:49:35.031000','cs_test_a1N3re9SV6w3XWDj9IeTbM5RI533uR66ZwJ81mpOYizFmSv4wfeOXEcbyc',520000,39);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2dylsfo39lgjyqml2tbe0b0ss` (`user_id`),
  CONSTRAINT `FK2dylsfo39lgjyqml2tbe0b0ss` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'hiep@gmail.com','Hiep','Nguyen ','$2a$10$7MDSGHP50yTBo9m.TpaXROxVdpb6MG.PqYXb//wgh9IijQG1Jt76O','PAQyIgph3pYDnXz8CCLluP8uXFm0G9','ROLE_ADMIN'),(4,'tuan@gmail.com','Lưu Quốc','Tuấn','$2a$10$U.w3dXkNO7WYgOd1Jei.0u/u0mBKU2qWvHtvebgK7zMSH/v02pnWK',NULL,'ROLE_ADMIN'),(12,'hiep2001.job@gmail.com','Hiep','Nguyen Thanh','$2a$10$pL/2pABmsbQuWCv93IVUd.APvDD.z9IlQBlSg9HrEDK4AQfNg4i9K',NULL,'ROLE_USER'),(39,'luuvanhang1967@gmail.com','Lưu','Quốc Tuấn','$2a$10$f9ahFQ43ffm9HguswicaJeUL7etRccsLVN5.SpmKJ.dZ3XwGIeq6q',NULL,'ROLE_USER');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `id` int NOT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKm5enjhac8nch6sen9m1th9gkw` (`book_id`),
  KEY `FKtrd6335blsefl2gxpb8lr0gr7` (`user_id`),
  CONSTRAINT `FKm5enjhac8nch6sen9m1th9gkw` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `FKtrd6335blsefl2gxpb8lr0gr7` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (35,'2023-04-07 22:43:33.632000',25,1),(44,'2023-04-08 00:59:09.484000',2,1),(47,'2023-04-08 01:27:23.838000',25,39),(55,'2023-04-08 22:23:18.310000',3,39);
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-14 13:15:40

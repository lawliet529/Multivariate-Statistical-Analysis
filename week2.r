# Bài 1: Cho bảng số liệu về điểm các môn: toán, tiếng anh, lịch sử, địa lí,
# hoá học, vật lí của 5 học sinh:
data <- read.csv("hocsinh.csv")
attach(data)

# a) Xét mẫu số liệu gồm 4 biến về điểm toán, lịch sử, địa lí, vật lí được lấy
#    trên 5 học sinh. Tính kỳ vọng mẫu.
colMeans(data[, c("toan", "lichsu", "diali", "vatli")])

# b) Tính phương sai mẫu, biết:
#    B1) Mẫu gồm 6 biến về điểm toán, tiếng anh, lịch sử, địa lí, hoá học, vật
#    lí và số liệu được lấy trên 3 học sinh 1, 3, 5.
#    B2) Mẫu gồm 3 biến về điểm tiếng anh, lịch sử, địa lí và số liệu được lấy
#    trên 5 học sinh.
var(data[c(1, 3, 5), -1])
var(data[, c("tienganh", "lichsu", "diali")])

# c) Tìm tương quan mẫu gồm 6 biến về điểm toán, tiếng anh, lịch sử, địa lí,
#    hoá học, vật lí và số liệu được lấy trên 4 học sinh 1, 2, 3, 5.
cor(data[c(1, 2, 3, 5), -1])

# Bài 2: Bảng số liệu dưới đây được thu thập trong một nghiên cứu ô nhiễm không
# khí tại các thành phố ở Mỹ. Số liệu về các biến sau được cho bởi 13 thành phố:
#   - SO2:        hàm lượng SO2 trong không khí (microgam/m3)
#   - Nhiệt độ:   nhiệt độ trung bình hằng năm (độ F)
#   - Số lượng:   số lượng doanh nghiệp sản xuất sử dụng 20 công nhân trở lên
#   - Dân số:     quy mô dân số ( điều tra dân số năm 1970) (nghìn người)
#   - Gió:        tốc độ gió trung bình hằng năm (dặm/giờ)
#   - Lượng mưa:  lượng mưa trung bình hằng năm (inch)
#   - Số ngày:    số ngày trung bình mưa mỗi năm
data <- read.csv("thanhpho.csv")
attach(data)
data <- na.omit(data)

# a) Tính kỳ vọng mẫu gồm 7 biến được lấy số liệu tại Albany, Atlanta, Chicago,
#    Cleveland, Colombus và Denver.
colMeans(data[ThanhPho %in% c("Albany", "Atlanta", "Chicago",
                              "Cleveland", "Colombus", "Denver"), -1])

# b) Với mẫu gồm 3 biến về hàm lượng SO2 trong không khí, nhiệt độ và lượng mưa
#    trung bình hằng năm tại 13 thành phố, hãy tính phương sai mẫu.
var(data[, c("SO2", "NhietDo", "LuongMua")])

# c) Tính tương quan mẫu gồm 7 biến được lấy số liệu tại 13 thành phố.
cor(data[, -1])

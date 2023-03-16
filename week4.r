# Tuần 4: Ôn tập #

# Cho bộ dữ liệu “Boston” gồm 506 quan sát của 14 biến liên quan đến giá nhà ở
# ngoại ô Boston trong gói lệnh MASS.

# a. Tính kỳ vọng mẫu, ma trận hiệp phương sai và ma trận tương quan mẫu giữa
#    14 biến. Dựa vào kết quả thu được, hãy cho biết hai biến nào có mối tương
#    quan chặt chẽ nhất.

# install.packages("MASS")
library(MASS)

data <- Boston
head(data)

colMeans(data)
cov(data)

cor = cor(data)
cor

diag(cor) = 0
max(abs(cor))

which(cor == max(abs(cor)), arr.ind = T)

# b. Tìm giá trị riêng và vecto riêng của ma trận tương quan mẫu.

eigen(cor)

# c. Kiểm định xem từng biến có tuân theo phân phối chuẩn một chiều không?

sapply(data, shapiro.test)

# d. “Khoảng cách” có tuân theo phân phối Khi-bình phương không?

m = mahalanobis(data, colMeans(data), cov(data))
chisq.test(m)

# e. Vecto ngẫu nhiên gồm 14 biến của bộ dữ liệu “Boston” có tuân theo phân
#    phối chuẩn 14-chiều không?

# Không, do cả 14 biến đều không tuân theo pp chuẩn 1 chiều.

# f. Vẽ biểu đồ thể hiện rõ vị trí tọa độ các điểm và các đường mức tương ứng
#    của vecto ngẫu nhiên 2-chiều gồm hai biến rm – số phòng trung bình trong
#    mỗi căn hộ và dis – khoảng cách trung bình đến năm trung tâm làm việc tại
#    Boston.

# install.packages("KernSmooth")
library(KernSmooth)

data1 <- data[c('rm', 'dis')]

datad <- bkde2D(data1, bandwidth = c(dpik(data1$rm), dpik(data1$dis)))
plot(data1)
contour(x = datad$x1, y = datad$x2, z = datad$fhat, add = TRUE)

# g. Vẽ biểu đồ thể hiện rõ hàm mật độ hai chiều của hai biến rm và dis.

persp(x = datad$x1, y = datad$x2, z = datad$fhat, xlab = "rm", ylab = "dis", zlab = "density")

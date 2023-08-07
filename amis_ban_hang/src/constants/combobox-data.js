// Các dữ liêu của combobox

// Trường xưng hô
const SALUTATION_DATA = [
  {
    text: '- Không chọn -',
  },
  {
    text: 'Ông',
  },
  {
    text: 'Bà',
  },
  {
    text: 'Anh',
  },
  {
    text: 'Chị',
  },
]

// Trường phòng ban
const DEPARTMENT_DATA = [
  {
    text: '- Không chọn -',
  },
  {
    text: 'Ban Giám đốc',
  },
  {
    text: 'Phòng Tài chính',
  },
  {
    text: 'Phòng Nhân sự',
  },
  {
    text: 'Phòng Marketing',
  },
  {
    text: 'Phòng CSKH',
  },
  {
    text: 'Phòng Hành chính tổng hợp',
  },
  {
    text: 'Phòng Kinh doanh',
  },
  {
    text: 'Phòng Công nghệ thông tin',
  },
  {
    text: 'Phòng thiết kế',
  },
]

//trường chức danh
const TITLE_DATA = [
  {
    text: '- Không chọn -',
  },
  {
    text: 'Chủ tịch',
  },
  {
    text: 'Phó chủ tịch ',
  },
  {
    text: 'Tổng giám đốc ',
  },
  {
    text: 'Phó TGD ',
  },
  {
    text: 'Giám đốc ',
  },
  {
    text: 'Kế toán trưởng ',
  },
  {
    text: 'Trưởng phòng ',
  },
  {
    text: 'Trợ lý ',
  },
  {
    text: 'Nhân viên ',
  },
]

//trường nguồn gốc
const LEAD_SOURCE_DATA = [
  {
    text: '- Không chọn -',
  },
  {
    text: 'Nhân viên kinh doanh tự tìm kiếm',
  },
  {
    text: 'Khách hàng hoặc đối tác giới thiệu',
  },
  {
    text: 'Thông qua hội thảo, tập huấn',
  },
  {
    text: 'Khách hàng tự tìm đến',
  },
  {
    text: 'Khách hàng được tặng miễn phí',
  },
  {
    text: 'Maketing',
  },
  {
    text: 'Khác',
  },
]

//trường loại khách hàng
const LEAD_TYPE_DATA = [
  {
    text: '- Không chọn -',
  },
  {
    text: 'KH thương mại',
  },
  {
    text: 'KH sản xuất',
  },
]

//trường doanh thu, ngân sách
const ANNUAL_REVENUE_DATA = [
  {
    text: '- Không chọn -',
  },
  {
    text: 'Dưới 2 tỷ đồng',
  },
  {
    text: '2 tỷ đồng đến 5 tỷ đồng',
  },
  {
    text: '5 tỷ đồng đến 10 tỷ đồng',
  },
  {
    text: '10 tỷ đồng đến 20 tỷ đồng',
  },
  {
    text: 'Trên 20 tỷ đồng',
  },
]

//trường quận huyên
const DISTRICT_DATA = [
  {
    text: '- Không chọn -',
  },
  {
    text: 'Hưng Nhân',
  },
  {
    text: 'Phú Sơn',
  },
]

//trường xã
const WARD_DATA = [
  {
    text: '- Không chọn -',
  },
  {
    text: 'Hưng Hà',
  },
  {
    text: 'Tây Xuyên',
  },
]

//trường tỉnh/thành phố
const PROVINCE_DATA = [
  {
    text: '- Không chọn -',
  },
  {
    text: 'Thái Bình',
  },
  {
    text: 'Hà Nội',
  },
]

//trường quốc gia
const COUNTRY_DATA = [
  {
    text: '- Không chọn -',
  },
  {
    text: 'Việt Nam',
  },
  {
    text: 'Thái Lan',
  },
]

//trường loại hình
const BUSINESS_TYPE_DATA = [
  {
    text: '- Không chọn -',
  },
  {
    text: 'Công ty TNHH',
  },
  {
    text: 'Công ty cổ phần',
  },
  {
    text: 'Công ty có vốn đầu tư nước ngoài',
  },
  {
    text: 'Doanh nghiệp tư nhân',
  },
  {
    text: 'Tổ chức phi chính phủ',
  },
  {
    text: 'Cửa hàng, trung tâm',
  },
  {
    text: 'Hợp tác xã',
  },
  {
    text: 'Công ty hợp doanh',
  },
  {
    text: 'Khác',
  },
  {
    text: 'Đơn vị HCSN cấp trung ương',
  },
  {
    text: 'Đơn vị HCSN cấp Tỉnh/Thành phố',
  },
  {
    text: 'Đơn vị HCSN cấp Quận/Huyện',
  },
]

//trường ngành nghề
const INDUSTRY_DATA = [
  {
    text: '- Không chọn -',
  },
  {
    text: 'Dệt may',
  },
  {
    text: 'Công nghệ thông tin',
  },
]

//trường lĩnh vực
const SECTOR_DATA = [
  {
    text: '- Không chọn -',
  },
  {
    text: 'Thương mại',
  },
  {
    text: 'Dịch vụ',
  },
  {
    text: 'Sản xuất',
  },
  {
    text: 'Xây lắp',
  },
  {
    text: 'Công nghiệp nhẹ',
  },
]

export {
  SALUTATION_DATA,
  DEPARTMENT_DATA,
  TITLE_DATA,
  LEAD_SOURCE_DATA,
  LEAD_TYPE_DATA,
  ANNUAL_REVENUE_DATA,
  DISTRICT_DATA,
  WARD_DATA,
  PROVINCE_DATA,
  COUNTRY_DATA,
  BUSINESS_TYPE_DATA,
  INDUSTRY_DATA,
  SECTOR_DATA,
}

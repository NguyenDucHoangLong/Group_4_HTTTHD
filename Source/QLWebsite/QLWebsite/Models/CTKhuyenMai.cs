//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QLWebsite.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class CTKhuyenMai
    {
        public int MaKM { get; set; }
        public int MaSP { get; set; }
        public Nullable<double> ChietKhau { get; set; }
        public Nullable<System.DateTime> NgayBD { get; set; }
        public Nullable<System.DateTime> NgayKT { get; set; }
    
        public virtual SanPham SanPham { get; set; }
    }
}

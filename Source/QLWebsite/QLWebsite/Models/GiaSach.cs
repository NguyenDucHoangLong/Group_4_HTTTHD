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
    
    public partial class GiaSach
    {
        public int MaGiaSach { get; set; }
        public Nullable<int> MaSP { get; set; }
        public Nullable<int> MaKH { get; set; }
    
        public virtual KhachHang KhachHang { get; set; }
        public virtual SanPham SanPham { get; set; }
    }
}

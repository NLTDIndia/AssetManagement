//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Assetmanagement
{
    using System;
    using System.Collections.Generic;
    
    public partial class AssetHistory
    {
        public long Id { get; set; }
        public long AssetRequestId { get; set; }
        public long TargetStatusId { get; set; }
        public long StatusChangedBy { get; set; }
        public System.DateTime StatusModifiedOn { get; set; }
        public string Comments { get; set; }
    
        public virtual AssetRequest AssetRequest { get; set; }
        public virtual Employee Employee { get; set; }
        public virtual AssetStatu AssetStatu { get; set; }
    }
}

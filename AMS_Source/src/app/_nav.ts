export const navItems = [  
  {
    name: 'ADMIN',
    url: '/admin',
    icon: '',
    children: [
      {
        name: 'Locations',
        url: '/admin/locations/locations',
        icon: ''
      },
      {
        name: 'Asset Categories',
        url: '/admin/asset-categories/asset-categories',
        icon: ''
      },
      {
        name: 'Asset Types',
        url: '/admin/assettypes/assettypes',
        icon: ''
      },
      {
        name: 'Vendors',
        url: '/admin/vendors/vendors',
        icon: ''
      },
    ]
  },  
  {
    name: 'ASSET REQUESTS',
    url: '/assestrequests',
    icon: '',
    children: [
      {
        name: 'Track Request',
        url: '/assetrequests/trackrequests/trackrequests',
        icon: ''
      },
      {
        name: 'Raise Request',
        url: '/assetrequests/raiserequests/raiserequests',
        icon: ''
      },
      {
        name: 'Manage Quotation',
        url: '/assetrequests/quotations/quotations',
        icon: ''
      },
      {
        name: 'Approve Quotation',
        url: '/assetrequests/approvequotations/approvequotations',
        icon: ''
      },
      {
        name: 'Raise PO',
        url: '/assetrequests/raisepos/raisepos',
        icon: ''
      },
      {
        name: 'Materialize PO',
        url: '/assetrequests/materializepos/materializepos',
        icon: ''
      },    
    ]
  },
  {
    name: 'ASSETS',
    url: '/assets',
    icon: '',
    children: [ 
      {
        name: 'Create New Asset',
        url: '/assets/createasset/createasset',
        icon: ''
      },
      {
        name: 'Manage Assets',
        url: '/assets/manageassets/manageassets',
        icon: ''
      },
      {
        name: 'Allocate Assets',
        url: '/assets/assetallocation/assetallocation',
        icon: ''
      },
      {
        name: 'Revoke Assets',
        url: '/assets/allocatedassets/allocatedassets',
        icon: ''
      },
    ]
  },
  {
    name: 'REPORTS',
    url: '/report',
    icon: '',
    children: [
      {
        name: 'Report Loac',
        url: '',
        icon: ''
      },
    ]
  },  
];

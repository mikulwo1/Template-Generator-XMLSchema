#!/usr/bin/perl 

use strict;
use warnings;

use Template;

my $tt    = Template->new( );
my $input = 'UBL-Invoice-2.1-Example.tt';
my $vars  = {
    Invoice => {
        UBLVersionID => "2.1",
        ID => "TOSL108",
        IssueDate => "2009-12-15",
        InvoiceTypeCode => {
            listID => "UN/ECE 1001 Subset",
            listAgencyID => "6",
            ttext => "380",
        }, 
        Notes => [
            {
                languageID => "en",
                ttext => "Ordered in our booth at the convention.",
            },
        ],
        TaxPointDate => "2009-11-30",
        DocumentCurrencyCode => {
            listID => "ISO 4217 Alpha",
            listAgencyID => "6",
            ttext => 'EUR',
        },
        AccountingCost => "Project cost code 123",
        InvoicePeriods => [
            {
                StartDate => "2009-11-01",
                EndDate => "2009-11-30",
            },
        ],
        OrderReference => {
                ID => '123',
        },
        ContractDocumentReferences => [
            {
                ID => 'Contract321',
                DocumentType => 'Framework agreement',
            },
        ],
        AdditionalDocumentReferences => [
            {
                ID => "Doc1",
                DocumentType => "Timesheet",
                Attachment => {
                    ExternalReference => {
                        URI => "http://www.suppliersite.eu/sheet001.html",
                    },
                },
            },
            {
                ID => "Doc2",
                DocumentType => "Drawing",
                Attachment => {
                    EmbeddedDocumentBinaryObject => {
                        mimeCode => "application/pdf",
                        ttext => "UjBsR09EbGhjZ0dTQUxNQUFBUUNBRU1tQ1p0dU1GUXhEUzhi",
                    },
                },
            },
        ],
        AccountingSupplierParty => {
            Party => {
                EndpointID => {
                    schemeID => "GLN",
                    schemeAgencyID => "9",
                    ttext => '1234567890123',
                },
                PartyIdentification => { 
                    ID => {
                        schemeID => "ZZZ",
                        ttext => "Supp123",
                    },
                },
                PartyNames => [
                    {
                        Name => "Salescompany ltd.",
                    },
                ],
                PostalAddress => {
                    ID => {
                        schemeID => "GLN",
                        schemeAgencyID => "9",
                        ttext => "1231412341324",
                    },
                    Postbox => "5467",
                    StreetName => "Main street",
                    AdditionalStreetName => "Suite 123",
                    BuildingNumber => "1",
                    Department => "Revenue department",
                    CityName => "Big city",
                    PostalZone => "54321",
                    CountrySubentityCode => "RegionA",
                    Country => {
                        IdentificationCode => {
                            listID => "ISO3166-1",
                            listAgencyID => "6",
                            ttext => "DK",
                        },
                    },
                },
                PartyTaxSchemes => [
                    {
                        CompanyID => {
                            schemeID => "DKVAT",
                            schemeAgencyID => "ZZZ",
                            ttext => "DK12345",
                        },
                        TaxScheme => {
                            ID => {
                                schemeID => "UN/ECE 5153",
                                schemeAgencyID => "6",
                                ttext => "VAT",
                            },
                        },
                    },
                ],
                PartyLegalEntities => [
                    {
                        RegistrationName => "The Sellercompany Incorporated",
                        CompanyID => {
                            schemeID => "CVR",
                            schemeAgencyID => "ZZZ",
                            ttext => "5402697509",
                        },
                        RegistrationAddress => {
                            CityName => "Big city",
                            CountrySubentity => "RegionA",
                            Country => {
                              IdentificationCode => "DK",  
                            },
                        },
                    },
                ],
                Contact => {
                    Telephone => "4621230",
                    Telefax => "4621231",
                    ElectronicMail => 'antonio@salescompany.dk',
                },
                Persons => [
                    {
                        FirstName => "Antonio",
                        FamilyName => "M",
                        MiddleName => "Salemacher",
                        JobTitle => "Sales manager",
                    },
                ],
            },
        },
        AccountingCustomerParty => {
            Party => {
                EndpointID => {
                    schemeID => "GLN",
                    schemeAgencyID => "9",
                    ttext => '1234567987654',
                },
                PartyIdentification => { 
                    ID => {
                        schemeID => "ZZZ",
                        ttext => "345KS5324",
                    },
                },
                PartyNames => [
                    {
                        Name => "Buyercompany ltd",
                    },
                ],
                PostalAddress => {
                    ID => {
                        schemeID => "GLN",
                        schemeAgencyID => "9",
                        ttext => "1238764941386",
                    },
                    Postbox => "123",
                    StreetName => "Anystreet",
                    AdditionalStreetName => "Back door",
                    BuildingNumber => "8",
                    Department => "Accounting department",
                    CityName => "Anytown",
                    PostalZone => "101",
                    CountrySubentity => "RegionB",
                    Country => {
                        IdentificationCode => {
                            listID => "ISO3166-1",
                            listAgencyID => "6",
                            ttext => "BE",
                        },
                    },
                },
                PartyTaxSchemes => [
                    {
                        CompanyID => {
                            schemeID => "BEVAT",
                            schemeAgencyID => "ZZZ",
                            ttext => "BE54321",
                        },
                        TaxScheme => {
                            ID => {
                                schemeID => "UN/ECE 5153",
                                schemeAgencyID => "6",
                                ttext => "VAT",
                            },
                        },
                    },
                ],
                PartyLegalEntities => [
                    {
                        RegistrationName => "The buyercompany inc.",
                        CompanyID => {
                            schemeID => "ZZZ",
                            schemeAgencyID => "ZZZ",
                            ttext => "5645342123",
                        },
                        RegistrationAddress => {
                            CityName => "Mainplace",
                            CountrySubentity => "RegionB",
                            Country => {
                              IdentificationCode => "BE",  
                            },
                        },
                    },
                ],
                Contact => {
                    Telephone => "5121230",
                    Telefax => "5121231",
                    ElectronicMail => 'john@buyercompany.eu',
                },
                Persons => [
                    {
                        FirstName => "John",
                        FamilyName => "X",
                        MiddleName => "Doe",
                        JobTitle => "Purchasing manager",
                    },
                ],
            },
        },
        # Still lot missing inside...
        InvoiceLines => [
            {
                ID => "1",
                Notes => [
                    {
                        ttext => "Scratch on box",
                    },
                ],
                LineExtensionAmount => {
                    currencyID => "EUR",
                    ttext => "1273",
                },
                InvoicedQuantity => {
                    unitCode => "C62",
                    ttext => "1",
                },
                AccountingCost => "BookingCode001",
                OrderLineReferences => [
                    {
                        LineID => "1",
                    },
                ],
                AllowanceCharges => [
                    {
                        ChargeIndicator => "false",
                        AllowanceChargeReason => "Damage",
                        Amount => {
                            currencyID => "EUR",
                            ttext => "12",
                        },
                    },
                    {
                        ChargeIndicator => "true",
                        AllowanceChargeReason => "Testing",
                        Amount => {
                            currencyID => "EUR",
                            ttext => "10",
                        },
                    },
                ],
                TaxTotals => [
                    {
                        TaxAmount => {
                            currencyID => "EUR",
                            ttext => "254.6",
                        },
                    },
                ],
                Item => {
                    Descriptions => [
                        {
                            languageID => "EN",
                            ttext => "Processor: Intel Core 2 Duo SU9400 LV (1.4GHz). RAM:\n\t\t\t\t3MB. Screen 1440x900",
                        },
                    ],
                    Name => "Labtop computer",
                    SellersItemIdentification => {
                        ID => "JB007",
                    },
                    StandardItemIdentification => {
                        ID => {
                            schemeID => "GTIN",
                            schemeAgencyID => "9",
                            ttext => "1234567890124",
                        }
                    },
                    CommodityClassifications => [
                        {
                           ItemClassificationCode => {
                                listAgencyID => "113",
                                listID => "UNSPSC",
                                ttext => "12344321",
                           },
                        },
                        {
                           ItemClassificationCode => {
                                listAgencyID => "2",
                                listID => "CPV",
                                ttext => "65434568",
                            },
                        },
                    ],
                    ClassifiedTaxCategories => [
                        {
                            xmlns => "urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2",
                            ID => {
                                schemeID => "UN/ECE 5305",
                                schemeAgencyID => "6",
                                ttext => "S",
                            },
                            Percent => "20",
                            TaxScheme => {
                                ID => {
                                    schemeID => "UN/ECE 5153",
                                    schemeAgencyID => "6",
                                    ttext => "VAT",
                                },
                            },
                        },
                    ],
                    AdditionalItemProperties => [
                        {
                            Name => "Color",
                            Value => "black",
                        },
                    ],
                },
                Price => {
                    PriceAmount => {
                        currencyID => "EUR",
                        ttext => "1273",
                    },
                    BaseQuantity => {
                        unitCode => "C62",
                        ttext => "1",
                    },
                    AllowanceCharges => [
                        {
                            ChargeIndicator => "false",
                            AllowanceChargeReasons => [
                                {
                                    ttext =>"Contract",
                                },
                            ],
                            MultiplierFactorNumeric => "0.15",
                            Amount => {
                                currencyID => "EUR",
                                ttext => "225",
                            },
                            BaseAmount => {
                                currencyID => "EUR",
                                ttext => "1500",
                            },
                        },
                    ],
                },
            },
            {
                ID => "2",
                Notes => [
                    {
                        ttext => "Cover is slightly damaged.",
                    },
                ],
                LineExtensionAmount => {
                    currencyID => "EUR",
                    ttext => "-3.96",
                },
                InvoicedQuantity => {
                    unitCode => "C62",
                    ttext => "-1",
                },
                OrderLineReferences => [
                    {
                        LineID => "5",
                    },
                ],
                TaxTotals => [
                    {
                        TaxAmount => {
                            currencyID => "EUR",
                            ttext => "-0.396",
                        },
                    },
                ],
                Item => {
                    Name => 'Returned "Advanced computing" book',
                    SellersItemIdentification => {
                        ID => "JB008",
                    },
                    StandardItemIdentification => {
                        ID => {
                            schemeID => "GTIN",
                            schemeAgencyID => "9",
                            ttext => "1234567890125",
                        }
                    },
                    CommodityClassifications => [
                        {
                           ItemClassificationCode => {
                                listAgencyID => "113",
                                listID => "UNSPSC",
                                ttext => "32344324",
                           },
                        },
                        {
                           ItemClassificationCode => {
                                listAgencyID => "2",
                                listID => "CPV",
                                ttext => "65434567",
                            },
                        },
                    ],
                    ClassifiedTaxCategories => [
                        {
                            xmlns => "urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2",
                            ID => {
                                schemeID => "UN/ECE 5305",
                                schemeAgencyID => "6",
                                ttext => "AA",
                            },
                            Percent => "10",
                            TaxScheme => {
                                ID => {
                                    schemeID => "UN/ECE 5153",
                                    schemeAgencyID => "6",
                                    ttext => "VAT",
                                },
                            },
                        },
                    ],
                },
                Price => {
                    PriceAmount => {
                        currencyID => "EUR",
                        ttext => "3.96",
                    },
                    BaseQuantity => {
                        unitCode => "C62",
                        ttext => "1",
                    },
                },
            },
            {
                ID => "3",
                LineExtensionAmount => {
                    currencyID => "EUR",
                    ttext => "4.96",
                },
                InvoicedQuantity => {
                    unitCode => "C62",
                    ttext => "2",
                },
                OrderLineReferences => [
                    {
                        LineID => "3",
                    },
                ],
                TaxTotals => [
                    {
                        TaxAmount => {
                            currencyID => "EUR",
                            ttext => "0.496",
                        },
                    },
                ],
                Item => {
                    Name => '"Computing for dummies" book',
                    SellersItemIdentification => {
                        ID => "JB009",
                    },
                    StandardItemIdentification => {
                        ID => {
                            schemeID => "GTIN",
                            schemeAgencyID => "9",
                            ttext => "1234567890126",
                        }
                    },
                    CommodityClassifications => [
                        {
                           ItemClassificationCode => {
                                listAgencyID => "113",
                                listID => "UNSPSC",
                                ttext => "32344324",
                           },
                        },
                        {
                           ItemClassificationCode => {
                                listAgencyID => "2",
                                listID => "CPV",
                                ttext => "65434566",
                            },
                        },
                    ],
                    ClassifiedTaxCategories => [
                        {
                            xmlns => "urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2",
                            ID => {
                                schemeID => "UN/ECE 5305",
                                schemeAgencyID => "6",
                                ttext => "AA",
                            },
                            Percent => "10",
                            TaxScheme => {
                                ID => {
                                    schemeID => "UN/ECE 5153",
                                    schemeAgencyID => "6",
                                    ttext => "VAT",
                                },
                            },
                        },
                    ],
                },
                Price => {
                    PriceAmount => {
                        currencyID => "EUR",
                        ttext => "2.48",
                    },
                    BaseQuantity => {
                        unitCode => "C62",
                        ttext => "1",
                    },
                    AllowanceCharges => [
                        {
                            ChargeIndicator => "false",
                            AllowanceChargeReasons => [
                                {
                                    ttext =>"Contract",
                                },
                            ],
                            MultiplierFactorNumeric => "0.1",
                            Amount => {
                                currencyID => "EUR",
                                ttext => "0.275",
                            },
                            BaseAmount => {
                                currencyID => "EUR",
                                ttext => "2.75",
                            },
                        },
                    ],
                },
            },
            {
                ID => "4",
                LineExtensionAmount => {
                    currencyID => "EUR",
                    ttext => "-25",
                },
                InvoicedQuantity => {
                    unitCode => "C62",
                    ttext => "-1",
                },
                OrderLineReferences => [
                    {
                        LineID => "2",
                    },
                ],
                TaxTotals => [
                    {
                        TaxAmount => {
                            currencyID => "EUR",
                            ttext => "0",
                        },
                    },
                ],
                Item => {
                    Name => 'Returned IBM 5150 desktop',
                    SellersItemIdentification => {
                        ID => "JB010",
                    },
                    StandardItemIdentification => {
                        ID => {
                            schemeID => "GTIN",
                            schemeAgencyID => "9",
                            ttext => "1234567890127",
                        }
                    },
                    CommodityClassifications => [
                        {
                           ItemClassificationCode => {
                                listAgencyID => "113",
                                listID => "UNSPSC",
                                ttext => "12344322",
                           },
                        },
                        {
                           ItemClassificationCode => {
                                listAgencyID => "2",
                                listID => "CPV",
                                ttext => "65434565",
                            },
                        },
                    ],
                    ClassifiedTaxCategories => [
                        {
                            xmlns => "urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2",
                            ID => {
                                schemeID => "UN/ECE 5305",
                                schemeAgencyID => "6",
                                ttext => "E",
                            },
                            Percent => "0",
                            TaxScheme => {
                                ID => {
                                    schemeID => "UN/ECE 5153",
                                    schemeAgencyID => "6",
                                    ttext => "VAT",
                                },
                            },
                        },
                    ],
                },
                Price => {
                    PriceAmount => {
                        currencyID => "EUR",
                        ttext => "25",
                    },
                    BaseQuantity => {
                        unitCode => "C62",
                        ttext => "1",
                    },
                },
            },
            {
                ID => "5",
                LineExtensionAmount => {
                    currencyID => "EUR",
                    ttext => "187.5",
                },
                InvoicedQuantity => {
                    unitCode => "C62",
                    ttext => "250",
                },
                AccountingCost => "BookingCode002",
                OrderLineReferences => [
                    {
                        LineID => "4",
                    },
                ],
                TaxTotals => [
                    {
                        TaxAmount => {
                            currencyID => "EUR",
                            ttext => "37.5",
                        },
                    },
                ],
                Item => {
                    Name => "Network cable",
                    SellersItemIdentification => {
                        ID => "JB011",
                    },
                    StandardItemIdentification => {
                        ID => {
                            schemeID => "GTIN",
                            schemeAgencyID => "9",
                            ttext => "1234567890128",
                        }
                    },
                    CommodityClassifications => [
                        {
                           ItemClassificationCode => {
                                listAgencyID => "113",
                                listID => "UNSPSC",
                                ttext => "12344325",
                           },
                        },
                        {
                           ItemClassificationCode => {
                                listAgencyID => "2",
                                listID => "CPV",
                                ttext => "65434564",
                            },
                        },
                    ],
                    ClassifiedTaxCategories => [
                        {
                            xmlns => "urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2",
                            ID => {
                                schemeID => "UN/ECE 5305",
                                schemeAgencyID => "6",
                                ttext => "S",
                            },
                            Percent => "20",
                            TaxScheme => {
                                ID => {
                                    schemeID => "UN/ECE 5153",
                                    schemeAgencyID => "6",
                                    ttext => "VAT",
                                },
                            },
                        },
                    ],
                    AdditionalItemProperties => [
                        {
                            Name => "Type",
                            Value => "Cat5",
                        },
                    ],
                },
                Price => {
                    PriceAmount => {
                        currencyID => "EUR",
                        ttext => "0.75",
                    },
                    BaseQuantity => {
                        unitCode => "C62",
                        ttext => "1",
                    },
                },
            },
        ],
    },
};

$tt->process($input, $vars) || die $tt->error( );

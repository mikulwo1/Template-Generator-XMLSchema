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
                        ttext => "231412341324",
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
    },
};

$tt->process($input, $vars) || die $tt->error( );

//
//  PrincipalModel.swift
//  GapsiApp
//
//  Created by Ricardo Alonso Diaz Alvarado on 23/04/23.
//

import Foundation

struct JsonModel: Codable {
    let responseStatus, responseMessage, sortStrategy, domainCode: String?
    let keyword: String?
    let item: WelcomeItem?
}

// MARK: - WelcomeItem
struct WelcomeItem: Codable {
    let props: Props

    enum CodingKeys: String, CodingKey {
        case props
    }
}

// MARK: - Props
struct Props: Codable {
    let pageProps: PageProps
}

// MARK: - PageProps
struct PageProps: Codable {
    let initialData: InitialData
}

// MARK: - InitialData
struct InitialData: Codable {
    let searchResult: SearchResult
}

// MARK: - Channel
struct Channel: Codable {
    let id, status: String
}

// MARK: - LayoutContainerData
struct LayoutContainerData: Codable {
    let type, flow: String
    let content: [ContentElement]
}

// MARK: - ContentElement
struct ContentElement: Codable {
    let type, flow: String
    let content: ContentContent
}

// MARK: - ContentContent
struct ContentContent: Codable {
    let type, id: String
    let mapping: [Mapping]
}

// MARK: - Mapping
struct Mapping: Codable {
    let type: MappingType
    let options: Options
}

// MARK: - Options
struct Options: Codable {
    let refID: String
    let tempoLabel: String?
    let displayInTempo: Bool?

    enum CodingKeys: String, CodingKey {
        case refID = "refId"
        case tempoLabel, displayInTempo
    }
}

enum MappingType: String, Codable {
    case external = "EXTERNAL"
    case zone = "ZONE"
}

// MARK: - TentacledConfigs
struct TentacledConfigs: Codable {
    let typename: String
    let moduleSource: String?
    let pillsV2: [PillsV2]?
    let topNavFacets, allSortAndFilterFacets: [Facet]?
    let rawConfigs: PurpleRawConfigs?
    let ad: Ad?
    let moduleLocation: String?
    let fitments, title, subTitle, urlLinkText: JSONNull?
    let url: JSONNull?
    let zoneV1: [ZoneV1]?

    enum CodingKeys: String, CodingKey {
        case typename = "__typename"
        case moduleSource, pillsV2, topNavFacets, allSortAndFilterFacets
        case rawConfigs = "_rawConfigs"
        case ad, moduleLocation, fitments, title, subTitle, urlLinkText, url, zoneV1
    }
}

// MARK: - Ad
struct Ad: Codable {
    let status, moduleType, platform, pageID: String
    let pageType, storeID, stateCode, zipCode: String
    let pageContext: PageContext
    let moduleConfigs: Configs
    let adsContext: AdsContext
    let adRequestComposite: AdRequestComposite
    let adContent: AdContent

    enum CodingKeys: String, CodingKey {
        case status, moduleType, platform
        case pageID = "pageId"
        case pageType
        case storeID = "storeId"
        case stateCode, zipCode, pageContext, moduleConfigs, adsContext, adRequestComposite, adContent
    }
}

// MARK: - AdContent
struct AdContent: Codable {
    let type: String
    let data: AdContentData
}

// MARK: - AdContentData
struct AdContentData: Codable {
    let typename, adUUID: String
    let adExpInfo: JSONNull?
    let moduleInfo: String
    let brands: [JSONAny]

    enum CodingKeys: String, CodingKey {
        case typename = "__typename"
        case adUUID = "adUuid"
        case adExpInfo, moduleInfo, brands
    }
}

// MARK: - AdRequestComposite
struct AdRequestComposite: Codable {
    let categoryID, facets, keyword: String
    let isDebug, isManualShelf: Bool

    enum CodingKeys: String, CodingKey {
        case categoryID = "categoryId"
        case facets, keyword, isDebug, isManualShelf
    }
}

// MARK: - AdsContext
struct AdsContext: Codable {
    let locationContext: LocationContext
    let itemID, categoryID, categoryName, brand: String
    let productName, productTypeID, normKeyword, verticalID: String
    let dedupeList: [String]

    enum CodingKeys: String, CodingKey {
        case locationContext
        case itemID = "itemId"
        case categoryID = "categoryId"
        case categoryName, brand, productName
        case productTypeID = "productTypeId"
        case normKeyword
        case verticalID = "verticalId"
        case dedupeList
    }
}

// MARK: - LocationContext
struct LocationContext: Codable {
    let zipCode, stateCode, storeID, pickupStore: String
    let deliveryStore, intent: String
    let incatchment: Bool

    enum CodingKeys: String, CodingKey {
        case zipCode, stateCode
        case storeID = "storeId"
        case pickupStore, deliveryStore, intent, incatchment
    }
}

// MARK: - Configs
struct Configs: Codable {
    let moduleLocation: String
}

// MARK: - PageContext
struct PageContext: Codable {
    let searchNormalize: SearchNormalize
}

// MARK: - SearchNormalize
struct SearchNormalize: Codable {
    let verticalID, normalizedQuery, originalQuery, rewrittenQuery: String
    let specificity, topQueryCatPath, topQueryCatPathName: String
    let productType: [ProductType]
    let analyticsLog: AnalyticsLog

    enum CodingKeys: String, CodingKey {
        case verticalID = "verticalId"
        case normalizedQuery = "normalized_query"
        case originalQuery = "original_query"
        case rewrittenQuery = "rewritten_query"
        case specificity
        case topQueryCatPath = "top_query_cat_path"
        case topQueryCatPathName = "top_query_cat_path_name"
        case productType = "product_type"
        case analyticsLog = "analytics_log"
    }
}

// MARK: - AnalyticsLog
struct AnalyticsLog: Codable {
    let feLog: FeLog

    enum CodingKeys: String, CodingKey {
        case feLog = "fe_log"
    }
}

// MARK: - FeLog
struct FeLog: Codable {
    let dept, g, s, trf: String
}

// MARK: - ProductType
struct ProductType: Codable {
    let name: String
    let score: Double
    let source: Source
}

enum Source: String, Codable {
    case classifier = "classifier"
}

// MARK: - Facet
struct Facet: Codable {
    let title, name: String
    let expandOnLoad: Bool?
    let type: String
    let layout: AffinityOverride
    let min, max: Int?
    let selectedMin, selectedMax: JSONNull?
    let unboundedMax: Bool?
    let stepSize: Int?
    let isSelected: JSONNull?
    let values: [ValueElement]?
}

enum AffinityOverride: String, Codable {
    case affinityOverrideDefault = "default"
    case pill = "pill"
}

// MARK: - ValueElement
struct ValueElement: Codable {
    let id, title: String?
    let name: String
    let expandOnLoad: Bool
    let description: JSONNull?
    let type: String?
    let itemCount: Int?
    let isSelected: Bool?
    let baseSEOURL: String?
    let values: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id, title, name, expandOnLoad, description, type, itemCount, isSelected
        case baseSEOURL = "baseSeoURL"
        case values
    }
}

// MARK: - PillsV2
struct PillsV2: Codable {
    let title, url: String
    let image: JSONNull?
}

// MARK: - PurpleRawConfigs
struct PurpleRawConfigs: Codable {
    let moduleLocation: String
    let rawConfigsLazy, title: String?

    enum CodingKeys: String, CodingKey {
        case moduleLocation
        case rawConfigsLazy = "lazy"
        case title
    }
}

// MARK: - ZoneV1
struct ZoneV1: Codable {
    let moduleID, zone: String
    let isP13NBtfModule, isNativeLazyLoaded: Bool

    enum CodingKeys: String, CodingKey {
        case moduleID = "moduleId"
        case zone
        case isP13NBtfModule = "isP13nBtfModule"
        case isNativeLazyLoaded
    }
}

// MARK: - Schedule
struct Schedule: Codable {
    let priority: Int
}

// MARK: - ContentLayoutPageMetadata
struct ContentLayoutPageMetadata: Codable {
    let location: PurpleLocation
    let pageContext: PageContext
}

// MARK: - PurpleLocation
struct PurpleLocation: Codable {
    let pickupStore, deliveryStore, intent, postalCode: String
    let stateOrProvinceCode, city, storeID: String
    let accessPointID, accessType, spokeNodeID: JSONNull?

    enum CodingKeys: String, CodingKey {
        case pickupStore, deliveryStore, intent, postalCode, stateOrProvinceCode, city
        case storeID = "storeId"
        case accessPointID = "accessPointId"
        case accessType
        case spokeNodeID = "spokeNodeId"
    }
}

// MARK: - BottomZone1Configs
struct BottomZone1Configs: Codable {
    let typename: String
    let rawConfigs: FluffyRawConfigs
    let ad: JSONNull?

    enum CodingKeys: String, CodingKey {
        case typename = "__typename"
        case rawConfigs = "_rawConfigs"
        case ad
    }
}

// MARK: - FluffyRawConfigs
struct FluffyRawConfigs: Codable {
    let moduleLocation, rawConfigsLazy: String

    enum CodingKeys: String, CodingKey {
        case moduleLocation
        case rawConfigsLazy = "lazy"
    }
}

// MARK: - BottomZone2Configs
struct BottomZone2Configs: Codable {
    let typename: String
    let rawConfigs: PurpleRawConfigs

    enum CodingKeys: String, CodingKey {
        case typename = "__typename"
        case rawConfigs = "_rawConfigs"
    }
}


// MARK: - INVALIDConfigs
struct INVALIDConfigs: Codable {
    let typename: String
    let zoneV1: [ZoneV1]

    enum CodingKeys: String, CodingKey {
        case typename = "__typename"
        case zoneV1
    }
}

// MARK: - PillsTopZoneConfigs
struct PillsTopZoneConfigs: Codable {
    let typename, moduleSource: String
    let pillsV2: [PillsV2]

    enum CodingKeys: String, CodingKey {
        case typename = "__typename"
        case moduleSource, pillsV2
    }
}

// MARK: - TopZone2Configs
struct TopZone2Configs: Codable {
    let typename: String
    let rawConfigs: Configs
    let moduleLocation: String
    let ad: Ad

    enum CodingKeys: String, CodingKey {
        case typename = "__typename"
        case rawConfigs = "_rawConfigs"
        case moduleLocation, ad
    }
}

// MARK: - TopZone3Configs
struct TopZone3Configs: Codable {
    let typename: String
    let topNavFacets, allSortAndFilterFacets: [Facet]

    enum CodingKeys: String, CodingKey {
        case typename = "__typename"
        case topNavFacets, allSortAndFilterFacets
    }
}

// MARK: - TopZone5Configs
struct TopZone5Configs: Codable {
    let typename: String
    let fitments: JSONNull?

    enum CodingKeys: String, CodingKey {
        case typename = "__typename"
        case fitments
    }
}

// MARK: - TopZone6Configs
struct TopZone6Configs: Codable {
    let typename: String
    let title, subTitle, urlLinkText, url: JSONNull?

    enum CodingKeys: String, CodingKey {
        case typename = "__typename"
        case title, subTitle, urlLinkText, url
    }
}

// MARK: - SearchResult
struct SearchResult: Codable {
    let itemStacks: [ItemStackElement]
}

// MARK: - ItemStackElement
struct ItemStackElement: Codable {
    let title, totalItemCountDisplay: String
    let items: [ItemElement]
}

// MARK: - ItemElement
struct ItemElement: Codable {
    let typename: String
    let availabilityStatusDisplayValue: String?
    let productLocationDisplayValue, externalInfoURL, canonicalURL: String?
    let canAddToCart, showOptions: Bool?
    let description: String?
    let flag: String?
    let fulfillmentBadges: [String]?
    let fulfillmentType: String?
    let id, usItemID: String?
    let image: String?
    let isOutOfStock: Bool?
    let name: String?
    let price: Int?
    let preOrder: PreOrder?
    let rating: Rating?
    let salesUnit: String?
    let variantList: [ItemVariantList]?
    let isVariantTypeSwatch: Bool?
    let offerID: String?
    let isAtfMarker: Bool?
    let sellerID: String?
    let sellerName: String?
    let sponsoredProduct: SponsoredProduct?
    let seeShippingEligibility: Bool?
    let itemType, topResult, quickShop: JSONNull?
    let aspectInfo: AspectInfo?
    let externalInfo: JSONNull?
    let numberOfReviews: Int?
    let imageInfo: ImageInfo?
    let variantCriteria: [VariantCriterion]?
    let productLocation: [ProductLocation]?
    let subscription: Subscription?
    let type: String?
    let salesUnitType: String?
    let specialBuy: Bool?
    let pac: JSONNull?
    let priceFlip, isSponsoredFlag: Bool?
    let averageRating: Double?
    let earlyAccessEvent: Bool?
    let arExperiences: ArExperiences?
    let fulfillmentIcon: FulfillmentIcon?
    let groupMetaData: GroupMetaData?
    let hasCarePlans: Bool?
    let imageSize: String?
    let petRx: PetRx?
    let quickShopCTALabel: JSONNull?
    let checkStoreAvailabilityATC: Bool?
    let eventAttributes: EventAttributes?
    let showAtc, similarItems: Bool?
    let fulfillmentBadgeGroups: JSONNull?
    let weightIncrement: Int?
    let annualEvent: Bool?
    let shortDescription: String?
    let isEarlyAccessItem: Bool?
    let badges: Badges?
    let fulfillmentTitle: FulfillmentTitle?
    let buyBoxSuppression: Bool?
    let vision: Vision?
    let badge: Badge?
    let snapEligible, showBuyNow: Bool?
    let category: Category?
    let classType: String?
    let annualEventV2: Bool?
    let shouldLazyLoad: Bool?
    let displayName: String?
    let fulfillmentSpeed: [String]?

    enum CodingKeys: String, CodingKey {
        case typename = "__typename"
        case availabilityStatusDisplayValue, productLocationDisplayValue
        case externalInfoURL = "externalInfoUrl"
        case canonicalURL = "canonicalUrl"
        case canAddToCart, showOptions, description, flag, fulfillmentBadges, fulfillmentType, id
        case usItemID = "usItemId"
        case image, isOutOfStock, name, price, preOrder, rating, salesUnit, variantList, isVariantTypeSwatch
        case offerID = "offerId"
        case isAtfMarker
        case sellerID = "sellerId"
        case sellerName, sponsoredProduct, seeShippingEligibility, itemType, topResult, quickShop, aspectInfo, externalInfo, numberOfReviews, imageInfo, variantCriteria, productLocation, subscription, type, salesUnitType, specialBuy, pac, priceFlip, isSponsoredFlag, averageRating, earlyAccessEvent, arExperiences, fulfillmentIcon, groupMetaData, hasCarePlans, imageSize, petRx, quickShopCTALabel, checkStoreAvailabilityATC, eventAttributes, showAtc, similarItems, fulfillmentBadgeGroups, weightIncrement, annualEvent, shortDescription, isEarlyAccessItem, badges, fulfillmentTitle, buyBoxSuppression, vision, badge, snapEligible, showBuyNow, category, classType, annualEventV2, shouldLazyLoad, displayName
        case fulfillmentSpeed
    }
}

// MARK: - ArExperiences
struct ArExperiences: Codable {
    let isARHome, isZeekit: Bool
}

// MARK: - AspectInfo
struct AspectInfo: Codable {
    let name, header, id, snippet: JSONNull?
}

enum ValueEnum: String, Codable {
    case inStock = "IN_STOCK"
    case unknown = "UNKNOWN"
}

// MARK: - Badge
struct Badge: Codable {
    let typename: String?
    let key: String?
    let text: String?
    let type: String?
    let id: String?
    let styleID: JSONNull?

    enum CodingKeys: String, CodingKey {
        case typename = "__typename"
        case key, text, type, id
        case styleID = "styleId"
    }
}

enum ID: String, Codable {
    case empty = ""
    case l1102 = "L1102"
    case l1103 = "L1103"
    case l1600 = "L1600"
}

enum BadgeKey: String, Codable {
    case bestseller = "BESTSELLER"
    case empty = ""
    case socialProofAtcFlag = "SOCIAL_PROOF_ATC_FLAG"
    case socialProofPurchasesFlag = "SOCIAL_PROOF_PURCHASES_FLAG"
}

enum Flag: String, Codable {
    case bestSeller = "Best seller"
    case empty = ""
    case in100PeopleSCarts = "In 100+ people's carts"
    case in50PeopleSCarts = "In 50+ people's carts"
    case the100BoughtSinceYesterday = "100+ bought since yesterday"
    case the50BoughtSinceYesterday = "50+ bought since yesterday"
}

enum BadgeType: String, Codable {
    case empty = ""
    case label = "LABEL"
}

enum BadgeTypename: String, Codable {
    case baseBadge = "BaseBadge"
}

// MARK: - Badges
struct Badges: Codable {
    let flags: [Badge]?
    let tags: [Tag]?
}

// MARK: - Tag
struct Tag: Codable {
    let typename: String?
    let key: String?
    let text: String?
    let type: String?

    enum CodingKeys: String, CodingKey {
        case typename = "__typename"
        case key, text, type
    }
}

enum TagKey: String, Codable {
    case pickup = "PICKUP"
    case saveWithWPlus = "SAVE_WITH_W_PLUS"
    case threePlusDayShipping = "THREE_PLUS_DAY_SHIPPING"
    case twoDayShipping = "TWO_DAY_SHIPPING"
}

enum FulfillmentBadge: String, Codable {
    case pickup = "Pickup"
    case saveWith = "Save with"
    case the2DayShipping = "2-day shipping"
    case the3DayShipping = "3+ day shipping"
}

enum TagType: String, Codable {
    case icon = "ICON"
    case label = "LABEL"
}

// MARK: - Category
struct Category: Codable {
    let path: JSONNull?
}

enum ClassTypeEnum: String, Codable {
    case regular = "REGULAR"
    case sponsoredVideoAd = "SponsoredVideoAd"
    case variant = "VARIANT"
}

// MARK: - EventAttributes
struct EventAttributes: Codable {
    let priceFlip, specialBuy: Bool?
}

// MARK: - FulfillmentIcon
struct FulfillmentIcon: Codable {
    let key: String
    let label: String
}

enum FulfillmentTitle: String, Codable {
    case titleShipToHomeNotAvailable = "title_shipToHome_not_available"
    case titleStoreNotAvailable = "title_store_not_available"
}

enum FulfillmentType: String, Codable {
    case fc = "FC"
    case marketplace = "MARKETPLACE"
    case store = "STORE"
}

// MARK: - GroupMetaData
struct GroupMetaData: Codable {
    let groupType, groupSubType: JSONNull?
    let numberOfComponents: Int
    let groupComponents: JSONNull?
}

// MARK: - ImageInfo
struct ImageInfo: Codable {
    let thumbnailURL: String?
    let size: String?

    enum CodingKeys: String, CodingKey {
        case thumbnailURL = "thumbnailUrl"
        case size
    }
}

enum Size: String, Codable {
    case the290392 = "290-392"
}

// MARK: - PetRx
struct PetRx: Codable {
    let eligible: Bool
}

// MARK: - PreOrder
struct PreOrder: Codable {
    let isPreOrder: Bool
    let streetDateDisplayable, streetDateType, streetDate: JSONNull?
}

// MARK: - ProductLocation
struct ProductLocation: Codable {
    let displayValue: String?
    let aisle: Aisle?
}

// MARK: - Aisle
struct Aisle: Codable {
    let zone: String?
    let aisle: Int?
}

// MARK: - Rating
struct Rating: Codable {
    let averageRating, numberOfReviews: Int
}

// MARK: - SponsoredProduct
struct SponsoredProduct: Codable {
    let spQs: String
    let clickBeacon: String
    let spTags, viewBeacon: JSONNull?
}

// MARK: - Subscription
struct Subscription: Codable {
    let typename: String?
    let subscriptionEligible: Bool

    enum CodingKeys: String, CodingKey {
        case typename = "__typename"
        case subscriptionEligible
    }
}

enum ItemTypename: String, Codable {
    case adPlaceholder = "AdPlaceholder"
    case product = "Product"
}

// MARK: - VariantCriterion
struct VariantCriterion: Codable {
    let name, type: String?
    let id: JSONNull?
    let displayName: String?
    let isVariantTypeSwatch: Bool?
    let variantList: [VariantCriterionVariantList]?
}

// MARK: - VariantCriterionVariantList
struct VariantCriterionVariantList: Codable {
    let id: JSONNull?
    let images: [String]?
    let name: String?
    let rank: Int?
    let swatchImageURL: String?
    let availabilityStatus: String?
    let products: [String]?
    let selectedProduct: SelectedProduct?

    enum CodingKeys: String, CodingKey {
        case id, images, name, rank
        case swatchImageURL = "swatchImageUrl"
        case availabilityStatus, products, selectedProduct
    }
}

// MARK: - SelectedProduct
struct SelectedProduct: Codable {
    let canonicalURL, usItemID: String?

    enum CodingKeys: String, CodingKey {
        case canonicalURL = "canonicalUrl"
        case usItemID = "usItemId"
    }
}

// MARK: - ItemVariantList
struct ItemVariantList: Codable {
    let name: String?
    let swatchImageURL, image: String?
    let productID, usItemID, canonicalURL: String?

    enum CodingKeys: String, CodingKey {
        case name
        case swatchImageURL = "swatchImageUrl"
        case image
        case productID = "productId"
        case usItemID = "usItemId"
        case canonicalURL = "canonicalUrl"
    }
}

// MARK: - Vision
struct Vision: Codable {
    let ageGroup: JSONNull?
    let visionCenterApproved: Bool?
}

// MARK: - Meta
struct Meta: Codable {
    let adsBeacon: AdsBeacon
    let query: String
    let stackID: Int
    let stackType, title, layoutEnum: String
    let totalItemCount: Int
    let totalItemCountDisplay: String
    let borderColor: JSONNull?
    let isPartialResult: Bool
    let subTitle, stackName, iconURL: JSONNull?

    enum CodingKeys: String, CodingKey {
        case adsBeacon, query
        case stackID = "stackId"
        case stackType, title, layoutEnum, totalItemCount, totalItemCountDisplay, borderColor, isPartialResult, subTitle, stackName
        case iconURL = "iconUrl"
    }
}

// MARK: - AdsBeacon
struct AdsBeacon: Codable {
    let adUUID, moduleInfo: String
    let maxAds: Int

    enum CodingKeys: String, CodingKey {
        case adUUID = "adUuid"
        case moduleInfo
        case maxAds = "max_ads"
    }
}

// MARK: - SearchResultPageMetadata
struct SearchResultPageMetadata: Codable {
    let title: String
    let storeSelectionHeader: JSONNull?
    let location: FluffyLocation
    let subscriptionEligible: Bool
}

// MARK: - FluffyLocation
struct FluffyLocation: Codable {
    let addressID: String

    enum CodingKeys: String, CodingKey {
        case addressID = "addressId"
    }
}

// MARK: - PaginationV2
struct PaginationV2: Codable {
    let maxPage: Int
    let pageProperties: PageProperties
}

// MARK: - PageProperties
struct PageProperties: Codable {
    let ps, spelling, stores, grid: String
    let query, catID, sort: String
    let displayGuidedNav: Bool
    let affinityOverride: AffinityOverride
    let ptss: String
    let itemStacksInterleavePosition: [ItemStacksInterleavePosition]
    let prg: String
    let page: Int
    let itemStacks: [String: ItemStackValue]
    let pap: PAP

    enum CodingKeys: String, CodingKey {
        case ps, spelling, stores, grid, query
        case catID = "cat_id"
        case sort, displayGuidedNav, affinityOverride, ptss, itemStacksInterleavePosition, prg, page, itemStacks, pap
    }
}

// MARK: - ItemStackValue
struct ItemStackValue: Codable {
    let usItemID: String

    enum CodingKeys: String, CodingKey {
        case usItemID = "usItemId"
    }
}

// MARK: - ItemStacksInterleavePosition
struct ItemStacksInterleavePosition: Codable {
    let stackID: Int

    enum CodingKeys: String, CodingKey {
        case stackID = "stackId"
    }
}

// MARK: - PAP
struct PAP: Codable {
    let polaris: Polaris
}

// MARK: - Polaris
struct Polaris: Codable {
    let rerankOffset: String
}

// MARK: - RequestContext
struct RequestContext: Codable {
    let isFitmentFilterQueryApplied: Bool
    let searchMatchType: String
    let categories: Categories
    let hasGicIntent: Bool
    let vertical: String
}

// MARK: - Categories
struct Categories: Codable {
    let id, name: String
}

// MARK: - InitialSearchQueryVariables
struct InitialSearchQueryVariables: Codable {
    let id, dealsID, query: String
    let page: Int
    let prg, facet, sort, rawFacet: String
    let seoPath: String
    let ps: Int
    let ptss, trsp, beShelfID, recallSet: String
    let moduleSearch, minPrice, maxPrice, storeSlotBooked: String
    let fitmentFieldParams: FitmentFieldParams
    let fitmentSearchParams: FitmentSearchParams
    let fetchMarquee, fetchSkyline, fetchSbaTop: Bool
    let catID: String
    let fetchGallery: Bool
    let limit: Int
    let enableFashionTopNav, enableFlattenedFitment, enableRelatedSearches, enableMultiSave: Bool
    let searchArgs: SearchArgs
    let enablePortableFacets: Bool
    let additionalQueryParams: AdditionalQueryParams
    let tenant: String
    let enableFacetCount: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case dealsID = "dealsId"
        case query, page, prg, facet, sort, rawFacet, seoPath, ps, ptss, trsp
        case beShelfID = "beShelfId"
        case recallSet = "recall_set"
        case moduleSearch = "module_search"
        case minPrice = "min_price"
        case maxPrice = "max_price"
        case storeSlotBooked, fitmentFieldParams, fitmentSearchParams, fetchMarquee, fetchSkyline, fetchSbaTop
        case catID = "catId"
        case fetchGallery, limit, enableFashionTopNav, enableFlattenedFitment, enableRelatedSearches, enableMultiSave, searchArgs, enablePortableFacets, additionalQueryParams, tenant, enableFacetCount
    }
}

// MARK: - AdditionalQueryParams
struct AdditionalQueryParams: Codable {
    let hiddenFacet, translation: JSONNull?
    let isMoreOptionsTileEnabled: Bool

    enum CodingKeys: String, CodingKey {
        case hiddenFacet = "hidden_facet"
        case translation, isMoreOptionsTileEnabled
    }
}

// MARK: - FitmentFieldParams
struct FitmentFieldParams: Codable {
    let powerSportEnabled: Bool
}

// MARK: - FitmentSearchParams
struct FitmentSearchParams: Codable {
    let id, dealsID, query: String
    let page: Int
    let prg, facet, sort, rawFacet: String
    let seoPath: String
    let ps: Int
    let ptss, trsp, recallSet, moduleSearch: String
    let minPrice, maxPrice, storeSlotBooked, fitmentSearchParamsCatID: String
    let beShelfID, catID: String
    let limit: Int
    let fitmentSearchParamsBeShelfID: String
    let searchArgs: SearchArgs
    let additionalQueryParams: AdditionalQueryParams

    enum CodingKeys: String, CodingKey {
        case id
        case dealsID = "dealsId"
        case query, page, prg, facet, sort, rawFacet, seoPath, ps, ptss, trsp
        case recallSet = "recall_set"
        case moduleSearch = "module_search"
        case minPrice = "min_price"
        case maxPrice = "max_price"
        case storeSlotBooked
        case fitmentSearchParamsCatID = "cat_id"
        case beShelfID = "_be_shelf_id"
        case catID = "catId"
        case limit
        case fitmentSearchParamsBeShelfID = "beShelfId"
        case searchArgs, additionalQueryParams
    }
}

// MARK: - SearchArgs
struct SearchArgs: Codable {
    let query, catID, prg, facet: String

    enum CodingKeys: String, CodingKey {
        case query
        case catID = "cat_id"
        case prg, facet
    }
}

// MARK: - PersistedQueriesConfig
struct PersistedQueriesConfig: Codable {
    let allowList, blackList: [String]
    let enableAllowList, enablePersistedQueries: Bool
}

// MARK: - Psych
struct Psych: Codable {
    let isMobile, isBot, isDesktop: Bool
    let trafficType: String
}

// MARK: - Trace
struct Trace: Codable {
    let traceID, spanID: String
    let traceFlags: Int

    enum CodingKeys: String, CodingKey {
        case traceID = "traceId"
        case spanID = "spanId"
        case traceFlags
    }
}

// MARK: - Query
struct Query: Codable {
    let query, sort, page: String
}

// MARK: - RuntimeConfig
struct RuntimeConfig: Codable {
    let nxApplicationName: String
    let isDev, enableLatencyTrace: Bool
    let tenant, vid: String
    let tenantV2: TenantV2
    let csp: CSP
    let mockURL: String
    let mock: Bool
    let endpointMappings: EndpointMappings
    let googleMaps: GoogleMaps
    let membershipConfig: MembershipConfig
    let pulseBeacon: PulseBeacon
    let perimeterX: PerimeterX
    let identity: Identity
    let threatMetrix: ThreatMetrix
    let paymentsPageURL, paymentsChooserPageURL, walletPageURL, wmcashFormPageURL: String
    let ads: RuntimeConfigAds
    let moatIvt: String
    let appVersion, appSHA, profile, tmxOrgID: String
    let dataCenter: String
    let queryContext: QueryContext

    enum CodingKeys: String, CodingKey {
        case nxApplicationName, isDev, enableLatencyTrace, tenant, vid, tenantV2, csp, mockURL, mock, endpointMappings, googleMaps, membershipConfig, pulseBeacon, perimeterX, identity, threatMetrix
        case paymentsPageURL = "paymentsPageUrl"
        case paymentsChooserPageURL = "paymentsChooserPageUrl"
        case walletPageURL = "walletPageUrl"
        case wmcashFormPageURL = "wmcashFormPageUrl"
        case ads, moatIvt, appVersion
        case appSHA = "appSha"
        case profile
        case tmxOrgID = "tmxOrgId"
        case dataCenter, queryContext
    }
}

// MARK: - RuntimeConfigAds
struct RuntimeConfigAds: Codable {
    let env: String
    let host: String
    let moatID, moatVideoID: String

    enum CodingKeys: String, CodingKey {
        case env, host
        case moatID = "moatId"
        case moatVideoID = "moatVideoId"
    }
}

// MARK: - CSP
struct CSP: Codable {
    let reportViolations: Bool
    let directives: Directives
    let reportURI: String

    enum CodingKeys: String, CodingKey {
        case reportViolations, directives
        case reportURI = "reportUri"
    }
}

// MARK: - Directives
struct Directives: Codable {
    let defaultSrc: ChildSrc
    let scriptSrc: ScriptSrc
    let styleSrc, fontSrc, imgSrc, connectSrc: ChildSrc
    let objectSrc, frameSrc, frameAncestors, mediaSrc: ChildSrc
    let workerSrc, childSrc: ChildSrc

    enum CodingKeys: String, CodingKey {
        case defaultSrc = "default-src"
        case scriptSrc = "script-src"
        case styleSrc = "style-src"
        case fontSrc = "font-src"
        case imgSrc = "img-src"
        case connectSrc = "connect-src"
        case objectSrc = "object-src"
        case frameSrc = "frame-src"
        case frameAncestors = "frame-ancestors"
        case mediaSrc = "media-src"
        case workerSrc = "worker-src"
        case childSrc = "child-src"
    }
}

// MARK: - ChildSrc
struct ChildSrc: Codable {
    let values: [String]
}

// MARK: - ScriptSrc
struct ScriptSrc: Codable {
    let nonce: Bool
    let values: [String]
}

// MARK: - EndpointMappings
struct EndpointMappings: Codable {
    let operations: Operations
    let queryStrings: QueryStrings
    let pages: [String: MutationMergeAndGetCart]
}

// MARK: - Operations
struct Operations: Codable {
    let queryConfiguration, queryRewardsHistoryPage, queryContentPage, queryBrandPage: MutationMergeAndGetCart
    let queryCheckItemCartEligibility, mutationMergeAndGetCart, queryGetGuestOrder: MutationMergeAndGetCart
    let queryPurchaseHistory: String
    let mutationNotifyCapOneBannerSnooze: MutationMergeAndGetCart
    let mutationCancelOrder: String
    let queryLastCallPage: MutationMergeAndGetCart
    let queryAdV2Display: String
    let queryGetCommPreference: MutationMergeAndGetCart
    let queryPurchasedProtectionPlans, queryProtectionPlanDetail: String
    let querySubscriptions, queryNodeDetailQuery, queryNearbyNodesQuery, queryLocalStoreContentQuery: MutationMergeAndGetCart
    let queryCartSubstitutions, queryCartShopSimilar: MutationMergeAndGetCart
    let queryGetEarlyAccessLearnMoreData: String
    let queryPostCartLoadPage, querySearchStore, queryLocalStoreCategoryContent, queryNodeDetails: MutationMergeAndGetCart
    let queryStoreFinderNearbyNodesQuery: MutationMergeAndGetCart
    let mutationCreateInsuranceSalesLead: String
    let mutationSetPickup, queryGetCart, queryFeedShowCategories, queryFeedsByStatus: MutationMergeAndGetCart
    let queryFeedShow: MutationMergeAndGetCart

    enum CodingKeys: String, CodingKey {
        case queryConfiguration = "query configuration"
        case queryRewardsHistoryPage = "query RewardsHistoryPage"
        case queryContentPage = "query ContentPage"
        case queryBrandPage = "query BrandPage"
        case queryCheckItemCartEligibility = "query checkItemCartEligibility"
        case mutationMergeAndGetCart = "mutation MergeAndGetCart"
        case queryGetGuestOrder = "query getGuestOrder"
        case queryPurchaseHistory = "query PurchaseHistory"
        case mutationNotifyCapOneBannerSnooze = "mutation NotifyCapOneBannerSnooze"
        case mutationCancelOrder = "mutation CancelOrder"
        case queryLastCallPage = "query LastCallPage"
        case queryAdV2Display = "query AdV2Display"
        case queryGetCommPreference = "query GetCommPreference"
        case queryPurchasedProtectionPlans = "query PurchasedProtectionPlans"
        case queryProtectionPlanDetail = "query ProtectionPlanDetail"
        case querySubscriptions = "query subscriptions"
        case queryNodeDetailQuery = "query NodeDetailQuery"
        case queryNearbyNodesQuery = "query NearbyNodesQuery"
        case queryLocalStoreContentQuery = "query LocalStoreContentQuery"
        case queryCartSubstitutions = "query CartSubstitutions"
        case queryCartShopSimilar = "query CartShopSimilar"
        case queryGetEarlyAccessLearnMoreData = "query GetEarlyAccessLearnMoreData"
        case queryPostCartLoadPage = "query PostCartLoadPage"
        case querySearchStore = "query SearchStore"
        case queryLocalStoreCategoryContent = "query LocalStoreCategoryContent"
        case queryNodeDetails = "query nodeDetails"
        case queryStoreFinderNearbyNodesQuery = "query storeFinderNearbyNodesQuery"
        case mutationCreateInsuranceSalesLead = "mutation CreateInsuranceSalesLead"
        case mutationSetPickup = "mutation setPickup"
        case queryGetCart = "query getCart"
        case queryFeedShowCategories = "query feedShowCategories"
        case queryFeedsByStatus = "query feedsByStatus"
        case queryFeedShow = "query feedShow"
    }
}

enum MutationMergeAndGetCart: String, Codable {
    case cecxo = "cecxo"
    case cegateway = "cegateway"
    case ceorders = "ceorders"
}

// MARK: - QueryStrings
struct QueryStrings: Codable {
    let stepCart, stepBookslot, entitytype, state: MutationMergeAndGetCart
    let source: MutationMergeAndGetCart

    enum CodingKeys: String, CodingKey {
        case stepCart = "step=cart"
        case stepBookslot = "step=bookslot"
        case entitytype = "entitytype=*"
        case state = "state=*"
        case source = "source=*"
    }
}

// MARK: - GoogleMaps
struct GoogleMaps: Codable {
    let checkAddressAPIKey, addressAPIKey, geoCodingAPIKey: String
    let riseMapAPIKey: RiseMapAPIKey
}

// MARK: - RiseMapAPIKey
struct RiseMapAPIKey: Codable {
    let dev, defaultKey: String
}

// MARK: - Identity
struct Identity: Codable {
    let context: Context
    let authFrameRoutes: AuthFrameRoutes
}

// MARK: - AuthFrameRoutes
struct AuthFrameRoutes: Codable {
    let frame, reauthFrame, gxoSignup, gxoSignin: String
}

// MARK: - Context
struct Context: Codable {
    let signOutURL, signInPathname, createAccountPathname: String
    let tenants: [Tenant]
    let marketingEmails: Bool

    enum CodingKeys: String, CodingKey {
        case signOutURL = "signOutUrl"
        case signInPathname, createAccountPathname, tenants, marketingEmails
    }
}

// MARK: - Tenant
struct Tenant: Codable {
    let host: Host
    let mart: String
    let templates: [String]
}

// MARK: - Host
struct Host: Codable {
    let stage, teflon, production: String
}

// MARK: - MembershipConfig
struct MembershipConfig: Codable {
    let showWPlusBanner: Bool
}

// MARK: - PerimeterX
struct PerimeterX: Codable {
    let enable: Bool
    let initScript: String
}

// MARK: - PulseBeacon
struct PulseBeacon: Codable {
    let enable: Bool
    let hostname, bd, bh, hostWithQM: String
    let hostWithoutQM, photoHost, photoHostWithoutQM: String
}

// MARK: - QueryContext
struct QueryContext: Codable {
    let appVersion: String
    let gql: Gql
    let rest: REST
}

// MARK: - Gql
struct Gql: Codable {
    let endpointsByName: GqlEndpointsByName
}

// MARK: - GqlEndpointsByName
struct GqlEndpointsByName: Codable {
    let ceaccount, cecxo, cecph, adsgateway: String
    let aroundme, ceorders, cegateway: String
    let wellness: String
}

// MARK: - REST
struct REST: Codable {
    let endpointsByName: RESTEndpointsByName
}

// MARK: - RESTEndpointsByName
struct RESTEndpointsByName: Codable {
    let cereturns, ceaccount, cehelp, cehelpchat: String
    let ceidentity, typeahead, espvalidation, warppaymentoptions: String
    let cewarp, ceccm, cewireless, storeservices: String
    let fuelPrices, feedbackSubmit, quimbyMobile, shopwithme: String
}

// MARK: - TenantV2
struct TenantV2: Codable {
    let bu, mart: String
}

// MARK: - ThreatMetrix
struct ThreatMetrix: Codable {
    let enable: Bool
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}

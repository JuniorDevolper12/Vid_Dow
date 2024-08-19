import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.widget.ImageView
import android.widget.RatingBar
import android.widget.TextView
import androidx.appcompat.widget.AppCompatButton
import com.example.video_downloader.R
import com.google.android.gms.ads.nativead.MediaView
import com.google.android.gms.ads.nativead.NativeAd
import com.google.android.gms.ads.nativead.NativeAdView
import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin

class ListTileNativeAdFactory(val context: Context) : GoogleMobileAdsPlugin.NativeAdFactory {

    override fun createNativeAd(
        nativeAd: NativeAd,
        customOptions: MutableMap<String, Any>?
    ): NativeAdView {
        val nativeAdView = LayoutInflater.from(context)
            .inflate(R.layout.splash_native_layout, null) as NativeAdView

        with(nativeAdView) {
            // Attribution views
            val attributionViewSmall =
                findViewById<TextView>(R.id.tv_list_tile_native_ad_attribution_small)
            val attributionViewLarge =
                findViewById<TextView>(R.id.tv_list_tile_native_ad_attribution_large)
            val iconView = findViewById<ImageView>(R.id.ad_app_icon)

            val icon = nativeAd.icon
            if (icon != null) {
                attributionViewSmall.visibility = View.VISIBLE
                attributionViewLarge.visibility = View.INVISIBLE
                iconView.setImageDrawable(icon.drawable)
            } else {
                attributionViewSmall.visibility = View.INVISIBLE
                attributionViewLarge.visibility = View.VISIBLE
            }
            this.iconView = iconView

            // Headline
            val headlineView = findViewById<TextView>(R.id.ad_headline)
            headlineView.text = nativeAd.headline
            this.headlineView = headlineView

            // Body
            val bodyView = findViewById<TextView>(R.id.ad_body)
            bodyView.text = nativeAd.body ?: ""
            bodyView.visibility = if (nativeAd.body == null) View.INVISIBLE else View.VISIBLE
            this.bodyView = bodyView

            // Advertiser
            val advertiserView = findViewById<TextView>(R.id.ad_advertiser)
            advertiserView.text = nativeAd.advertiser ?: ""
            advertiserView.visibility =
                if (nativeAd.advertiser == null) View.INVISIBLE else View.VISIBLE
            this.advertiserView = advertiserView

            // Media
            val mediaView = findViewById<MediaView>(R.id.ad_media)
            this.mediaView = mediaView

            // Rating
            val ratingBar = findViewById<RatingBar>(R.id.ad_stars)
            if (nativeAd.starRating != null) {
                ratingBar.rating = nativeAd.starRating!!.toFloat()
                ratingBar.visibility = View.VISIBLE
            } else {
                ratingBar.visibility = View.INVISIBLE
            }

            // Call to action
            val callToActionView = findViewById<AppCompatButton>(R.id.ad_call_to_action)
            callToActionView.text = nativeAd.callToAction
            this.callToActionView = callToActionView

            // Price
            val priceView = findViewById<TextView>(R.id.ad_price)
            priceView.text = nativeAd.price ?: ""
            priceView.visibility = if (nativeAd.price == null) View.GONE else View.VISIBLE
            this.priceView = priceView

            // Store
            val storeView = findViewById<TextView>(R.id.ad_store)
            storeView.text = nativeAd.store ?: ""
            storeView.visibility = if (nativeAd.store == null) View.GONE else View.VISIBLE
            this.storeView = storeView

            setNativeAd(nativeAd)
        }

        return nativeAdView
    }
}

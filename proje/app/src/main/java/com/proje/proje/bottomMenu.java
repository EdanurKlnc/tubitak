package com.proje.proje;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;

import android.os.Bundle;
import android.view.MenuItem;

import com.google.android.material.badge.BadgeDrawable;
import com.google.android.material.bottomnavigation.BottomNavigationView;
import com.google.android.material.navigation.NavigationBarView;

public class bottomMenu extends AppCompatActivity {
    BottomNavigationView bottomNavigationView;
    BadgeDrawable badge;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_bottom_menu);
        bottomNavigationView = findViewById(R.id.bottomNav);
        getSupportFragmentManager().beginTransaction().replace(R.id.frameLayout, new Fragment1()).commit();
        badge=bottomNavigationView.getOrCreateBadge(R.id.message);
        badge.setNumber(1000);
        bottomNavigationView.setOnItemReselectedListener(new NavigationBarView.OnItemReselectedListener() {
            @Override
            public void onNavigationItemReselected(@NonNull MenuItem item) {
                badge = bottomNavigationView.getBadge(item.getItemId());
                if (badge != null){
                    badge.clearNumber();
                }
                Fragment fragment = null;
                switch (item.getItemId()){
                    case R.id.search:
                        fragment=new Fragment1();
                        break;
                    case R.id.mytravel:
                        fragment=new Fragment2();
                        break;
                    case R.id.share:
                        fragment=new Fragment3();
                        break;
                    case R.id.profil:
                        fragment=new Fragment4();
                        break;
                }
                getSupportFragmentManager().beginTransaction().replace(R.id.frameLayout,fragment).commit();

                return;
            }
        });
    }
}
<?php

?>
<footer class="page-footer black">
          <div class="container">
            <div class="row">
              <div class="col l6 s12">
                <h5 class="white-text" id="footer_logo">Dolores perfumes</h5>
                <p class="white-text text-lighten-4 center-align">
                    <ul class="center-align">
                    <li> Working hours: 9am to 5pm Monday -> Friday</li>
                    <li> We are delivering during whole week</li>
                    <li> For any questions, please contact us at dolores@support.com</li>

                    </ul>
                </p>
              </div>
              <div class="col l4 offset-l2 s12 center-align">
                <h5 class="white-text">Social media</h5>
                <ul class="center-align" id="social_media">
                  <?php 
                    require_once "models/links/functions.php";
                    $links = get_social_links();
                  ?>
                  <?php foreach ($links as $link):?>
                  <li> <a href="<?=$link->src?>" target="_blank" class="white-text"> <?= $link->link_name ?></a> </li>
                  <?php endforeach;?>
                </ul>
              </div>
            </div>
          </div>
          <div class="footer-copyright">
            <div class="container white-text">
            <span class="footer_bottom_links"> &copy; 2020 Stefan Bogdanovski 85/18 </span>
            <a class="white-text right footer_bottom_links" target="_blank" href="https://technologyy.netlify.app/about.html">Author</a>
            <a class="white-text right footer_bottom_links" target="_blank" href="assets/Documentation.pdf">Documentation</a>
            </div>
          </div>
</footer>
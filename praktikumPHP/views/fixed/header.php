<?php
  require_once "models/links/functions.php";
  $authorised = isset($_SESSION['user']) ? 1 : 0;
  $linkovi = get_nav_links($authorised);
?>
<header>
  <nav class="white">
    <div class="nav-wrapper">
        <div class="container">
        <a href="index.php" class="brand-logo grey-text darken-2" id="Logo">Dolores</a>
        <a href="#" data-target="mobile-demo" class="sidenav-trigger grey-text text-darken-4"><i class="material-icons small" id="menuBars">menu</i></a>
        <ul class="right hide-on-med-and-down grey-text text-darken-4">
        <?php foreach ($linkovi as $key):?>

          <li>
            <a href="<?=$key->src?>" class="grey-text text-darken-4
              <?php if($key->link_name == "Sign in" || $key->link_name == "Register")
                {
                  echo " modal-trigger";
                }
              ?>"
            >
            
          <?=$key->link_name?>
          </a>
          </li>
      
        <?php endforeach;?>
        </ul>
        </div>
    </div>
  </nav>
  <ul class="sidenav grey-text text-darken-4" id="mobile-demo">
    <?php foreach ($linkovi as $key):?>

      <li>
        <a href="<?=$key->src?>" class="grey-text text-darken-4
          <?php if($key->link_name == "Sign in" || $key->link_name == "Register")
            {
              echo " modal-trigger";
            }
          ?>">
          <?=$key->link_name?>
        </a>
      </li>

    <?php endforeach;?>
  </ul>
<?php require_once "views/modals/sign_in.php"; ?>
<?php require_once "views/modals/register.php"; ?>

</header>
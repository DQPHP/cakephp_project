<?php echo $this->element('header');?>

    <?php echo $this->fetch('content'); ?>
    <hr>
    <!-- Footer -->
    <footer>
        <div class="row">
            <div class="col-lg-12">
                <p>&copy; 七联 2014 - <?php echo date('Y');?></p>
            </div>
        </div>
    </footer>
    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="/appointment/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/appointment/js/bootstrap.min.js"></script>

    <!-- Script to Activate the Carousel -->
    <script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
    </script>

</body>

</html>
